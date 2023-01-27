resource "aws_security_group" "eks-cluster-sg" {
  name   = var.sg-cluster-name
  vpc_id = aws_vpc.vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    "Name" = "eks-cluster-sg"
  }
}

resource "aws_security_group_rule" "cluster-inbound" {
  type              = "ingress"
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 0
  protocol          = var.protocol
  to_port           = 65535
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks-cluster-sg.id
}

resource "aws_security_group_rule" "cluster-inbound1" {
  type              = "ingress"
  description       = "Allow workstation to communicate with the cluster API Server"
  from_port         = 22
  protocol          = var.protocol
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks-cluster-sg.id
}