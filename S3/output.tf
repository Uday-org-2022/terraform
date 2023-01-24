output "s3_bucket_id" {
  value = aws_s3_bucket.b.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.b.arn
}

output "s3_bucket_region" {
  value = aws_s3_bucket.b.region
}

output "aws_s3_bucket_website" {
  value = aws_s3_bucket_website_configuration.static.*.website_endpoint
}