#create the s3 bucket 
resource "aws_s3_bucket" "b" {
  bucket        = var.bucket
  force_destroy = true
}
#acl
resource "aws_s3_bucket_acl" "acl" {
  bucket = aws_s3_bucket.b.id
  acl    = var.acllist1
}

#policy
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.b.id
  policy = <<POLICY
{    
    "Version": "2012-10-17",    
    "Statement": [        
      {            
          "Sid": "PublicReadGetObject",            
          "Effect": "Allow",            
          "Principal": "*",            
          "Action": [                
             "s3:GetObject"            
          ],            
          "Resource": [
             "arn:aws:s3:::${aws_s3_bucket.b.id}/*"            
          ]        
      }    
    ]
}
POLICY
}

#versioning_configuration
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.b.id
  versioning_configuration {
    status = var.versionstatus
  }
}

#static-web-hosting
resource "aws_s3_bucket_website_configuration" "static" {
  bucket = aws_s3_bucket.b.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}

#upload a object file
resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.b.id
  key    = "policy"
  source = "E:\\Terraform-Scripts\\S3\\policy.json"
}

#upload folders and file multiple
resource "null_resource" "multiple" {
  provisioner "local-exec" {
    command = "aws s3 sync E:\\Terraform-Scripts\\S3\\cors-2 s3://uudhhay-123"
  }
}

#upload a multiple file(only files)
resource "aws_s3_bucket_object" "dist" {
  for_each = fileset("E:\\Terraform-Scripts\\S3\\cors-2\\", "*")
  bucket   = aws_s3_bucket.b.id
  key      = each.value
  source   = "E:\\Terraform-Scripts\\S3\\cors-2\\${each.value}"
}

#lifecycle congiguration
resource "aws_s3_bucket_lifecycle_configuration" "versioning-bucket-config" {
  # Must have bucket versioning enabled first
  depends_on = [aws_s3_bucket_versioning.versioning]
  bucket     = aws_s3_bucket.b.id

  rule {
    id = "index"

    filter {
      prefix = "index.html"
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }

  rule {
    id = "asset"

    filter {
      prefix = "assets/"
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }
}