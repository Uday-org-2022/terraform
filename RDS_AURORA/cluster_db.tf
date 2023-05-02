#primary
resource "aws_db_subnet_group" "subnet" {
  provider   = aws.primary
  name       = var.subnet_group_name
  subnet_ids = [aws_subnet.sub1.id, aws_subnet.sub2.id]

  tags = {
    "Name" = var.subnet_group_name
  }
}

resource "aws_rds_cluster_parameter_group" "pg_group" {
  provider    = aws.primary
  name        = var.parameter-group-name
  family      = var.family
  description = "DB cluster parameter group"

  dynamic "parameter" {
    for_each = var.cluster_parameters
    content {
      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }

  }
}

#global
resource "aws_rds_global_cluster" "global" {
  global_cluster_identifier = var.global_cluster_identifier
  engine                    = var.engine
  engine_version            = var.engine_version
  database_name             = var.database_name
  storage_encrypted         = var.true
}
#primary
resource "aws_rds_cluster" "primary" {
  provider                        = aws.primary
  cluster_identifier              = var.cluster_identifier
  global_cluster_identifier       = aws_rds_global_cluster.global.id
  engine                          = aws_rds_global_cluster.global.engine
  engine_mode                     = var.engine_mode
  engine_version                  = aws_rds_global_cluster.global.engine_version
  database_name                   = var.database_name
  master_username                 = var.username
  master_password                 = random_password.password1.result
  db_subnet_group_name            = aws_db_subnet_group.subnet.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pg_group.name
  vpc_security_group_ids          = [aws_security_group.db_security.id]
  port                            = var.sg_port
  storage_encrypted               = var.true
  deletion_protection             = var.false #var.true
  backup_retention_period         = var.backup_retention_period
  apply_immediately               = var.true
  enable_http_endpoint            = var.false
  skip_final_snapshot             = var.true


  depends_on = [aws_vpc.a, aws_rds_cluster_parameter_group.pg_group, aws_db_subnet_group.subnet]
}

resource "aws_rds_cluster_instance" "primary_instance" {
  provider             = aws.primary
  count                = var.int_count
  engine               = aws_rds_global_cluster.global.engine
  engine_version       = aws_rds_global_cluster.global.engine_version
  identifier           = "${var.identifier}-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.primary.id
  instance_class       = var.instance_class
  db_subnet_group_name = aws_db_subnet_group.subnet.name
  apply_immediately    = var.true
  publicly_accessible  = var.true

  tags = {
    envname = "dev"
    envtype = "1"
  }
}

#autoscaling
resource "aws_appautoscaling_target" "primary-ag" {
  provider           = aws.primary
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.primary.cluster_identifier}"
  min_capacity       = 1
  max_capacity       = 15
}

resource "aws_appautoscaling_policy" "primary-cpu" {
  provider           = aws.primary
  name               = "cpu-primary-autoscaling"
  service_namespace  = aws_appautoscaling_target.primary-ag.service_namespace
  scalable_dimension = aws_appautoscaling_target.primary-ag.scalable_dimension
  resource_id        = aws_appautoscaling_target.primary-ag.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    target_value       = 75
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}

#secondary
resource "aws_db_subnet_group" "subnet-secondary" {
  provider   = aws.secondary
  name       = var.subnet_group_name_secondary
  subnet_ids = [aws_subnet.sub3.id, aws_subnet.sub4.id]

  tags = {
    "Name" = var.subnet_group_name_secondary
  }
}

resource "aws_rds_cluster_parameter_group" "pg-group-secondary" {
  provider    = aws.secondary
  name        = var.parameter-group-name-secondary
  family      = var.family
  description = "DB cluster parameter group secondary"

  dynamic "parameter" {
    for_each = var.cluster_parameters_secondary
    content {
      apply_method = lookup(parameter.value, "apply_method", null)
      name         = parameter.value.name
      value        = parameter.value.value
    }

  }

  lifecycle {
    create_before_destroy = false
  }
}

resource "aws_rds_cluster" "secondary" {
  provider                        = aws.secondary
  cluster_identifier              = var.cluster_identifier_secondary
  global_cluster_identifier       = aws_rds_global_cluster.global.id
  engine                          = aws_rds_global_cluster.global.engine
  engine_mode                     = var.engine_mode
  engine_version                  = aws_rds_global_cluster.global.engine_version
  db_subnet_group_name            = aws_db_subnet_group.subnet-secondary.name
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pg-group-secondary.name
  vpc_security_group_ids          = [aws_security_group.db_security_secondary.id]
  port                            = var.sg_port
  storage_encrypted               = var.true
  deletion_protection             = var.false #var.true
  backup_retention_period         = var.backup_retention_period
  apply_immediately               = var.true
  enable_http_endpoint            = var.false
  skip_final_snapshot             = var.true
  kms_key_id                      = aws_kms_key.default.arn

  depends_on = [aws_vpc.b, aws_rds_cluster_parameter_group.pg-group-secondary, aws_db_subnet_group.subnet-secondary, aws_rds_cluster.primary, aws_rds_cluster_instance.primary_instance, aws_kms_key.default]
}

resource "aws_rds_cluster_instance" "secondary_instance" {
  provider             = aws.secondary
  count                = var.int_count
  engine               = aws_rds_global_cluster.global.engine
  engine_version       = aws_rds_global_cluster.global.engine_version
  identifier           = "${var.identifier-secondary}-${count.index + 1}"
  cluster_identifier   = aws_rds_cluster.secondary.id
  instance_class       = var.instance_class
  db_subnet_group_name = aws_db_subnet_group.subnet-secondary.name
  apply_immediately    = var.true
  publicly_accessible  = var.true

  tags = {
    envname = "dev1"
    envtype = "2"
  }
}

#autoscaling
resource "aws_appautoscaling_target" "secondary-ag" {
  provider           = aws.secondary
  service_namespace  = "rds"
  scalable_dimension = "rds:cluster:ReadReplicaCount"
  resource_id        = "cluster:${aws_rds_cluster.secondary.cluster_identifier}"
  min_capacity       = 1
  max_capacity       = 15
}

resource "aws_appautoscaling_policy" "secondary-cpu" {
  provider           = aws.secondary
  name               = "cpu-primary-autoscaling"
  service_namespace  = aws_appautoscaling_target.secondary-ag.service_namespace
  scalable_dimension = aws_appautoscaling_target.secondary-ag.scalable_dimension
  resource_id        = aws_appautoscaling_target.secondary-ag.resource_id
  policy_type        = "TargetTrackingScaling"

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "RDSReaderAverageCPUUtilization"
    }

    target_value       = 75
    scale_in_cooldown  = 300
    scale_out_cooldown = 300
  }
}
