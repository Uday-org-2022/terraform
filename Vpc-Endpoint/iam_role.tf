# Create an IAM role
resource "aws_iam_role" "s3_access_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com" # Adjust this based on your needs
        }
      }
    ]
  })
}

# Create an IAM policy for S3 access
resource "aws_iam_policy" "s3_access_policy" {
  name        = var.policy_access_name
  description = "A policy to allow S3 access"
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "VisualEditor0",
        "Effect" : "Allow",
        "Action" : [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3-object-lambda:*"
        ],
        "Resource" : "*"
      }
    ]
  })
}
# Attach the policy to the role

resource "aws_iam_role_policy_attachment" "name" {
  role       = aws_iam_role.s3_access_role.name
  policy_arn = aws_iam_policy.s3_access_policy.arn
}

#attach instance to iam profile
resource "aws_iam_instance_profile" "s3_access_with_ec2" {
  name = var.Insance_profile
  role = aws_iam_role.s3_access_role.name
}

