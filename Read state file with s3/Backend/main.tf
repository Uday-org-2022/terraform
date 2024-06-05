#create s3

resource "aws_s3_bucket" "main" {
    bucket = "backend-terraform-state-file-uuddhay-01"
    acl = "private"
    force_destroy = true  
}

resource "aws_s3_bucket_versioning" "version" {
    bucket = aws_s3_bucket.main.id
    versioning_configuration {
      status = "Enabled"
    }
    
}

#create dynamodbtable
resource "aws_dynamodb_table" "state-lock" {
  name         = "state-lock"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"

  attribute {
    name = "LockID"
    type = "S"
  }
}