#Generates an 8-character hex string
resource "random_id" "suffix" {
  byte_length = 4
}

#create s3
resource "aws_s3_bucket" "bucket" {
  bucket        = "uudhhay-backend-${random_id.suffix.hex}"
  force_destroy = true

  tags = {
    Name        = "uudhhay-backend-1"
    Environment = "dev"
    Owner       = "Uday"
  }
}

/*
resource "aws_s3_bucket_acl" "f_acl" {
  bucket = aws_s3_bucket.f.id
  acl    = "private"
}
*/

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "f_encryption" {
  bucket = aws_s3_bucket.bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "f_block" {
  bucket = aws_s3_bucket.bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

#create dynamodbtable
resource "aws_dynamodb_table" "state-lock" {
  name         = "state-lock-${random_id.suffix.hex}"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}
