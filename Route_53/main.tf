#VPC
data "aws_vpc" "vpc" {
  id = var.vpc_id
}



#public ZONE
resource "aws_route53_zone" "public" {
  name = var.domain-pub

  tags = {
    Environment = "dev"
  }
}

#private Zone
resource "aws_route53_zone" "private" {
  name = var.domain-priv
  vpc {
    vpc_id = data.aws_vpc.vpc.id
  }
}

#recordtype-A
resource "aws_route53_record" "ip" {
  zone_id = aws_route53_zone.public.zone_id
  name    = var.domain-pub
  type    = "A"
  ttl     = "300"
  records = ["172.31.35.242"]
}

#recordtype-lb-alias
resource "aws_elb" "main" {
  name               = "foobar-terraform-elb"
  availability_zones = ["ap-south-1a"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

resource "aws_route53_record" "alias" {
  zone_id = aws_route53_zone.public.zone_id
  name    = "foo.uudhhay.co.in"
  type    = "A"

  alias {
    name                   = aws_elb.main.dns_name
    zone_id                = aws_elb.main.zone_id
    evaluate_target_health = true
  }
}