#create s3
resource "aws_s3_bucket" "f" {
  bucket = "uudhhay-backend-1"
  acl    = "private"
  force_destroy = true

  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}

#create dynamodbtable
resource "aws_dynamodb_table" "state-lock" {
  name             = "state-lock"
  hash_key         = "LockID"
  billing_mode     = "PAY_PER_REQUEST"
  
  attribute {
    name = "LockID"
    type = "S"
  }
}
