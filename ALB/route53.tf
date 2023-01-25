resource "aws_route53_zone" "mithun" {
  name = "mithuntechdevops.co.in"

  tags = {
    "Environment" = "dev"
  }
}

resource "aws_route53_record" "record1" {
  zone_id = aws_route53_zone.mithun.zone_id
  name    = "appp.mithuntechdevops.co.in"
  type    = "A"

  alias {
    name                   = aws_lb.test.dns_name
    zone_id                = aws_lb.test.zone_id
    evaluate_target_health = true
  }

  depends_on = [
    aws_lb.test,
    aws_route53_zone.mithun
  ]

}