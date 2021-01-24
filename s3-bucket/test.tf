
provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "Mybucket" {
  bucket = local.s3_bucket_name
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_public_access_block" "Mybucket" {
  bucket = aws_s3_bucket.Mybucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_iam_policy" "MybucketPolicy" {
  name        = "${local.s3_bucket_name}-MybucketPolicy"
  description = "My test policy For terraform practice"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
                "arn:aws:s3:::${local.s3_bucket_name}/*",
                "arn:aws:s3:::${local.s3_bucket_name}"
            ]
    }
  ]
}
EOF

}