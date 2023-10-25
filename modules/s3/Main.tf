resource "aws_s3_bucket" "lambda_s3" {
  bucket = "tech-challenge-s3-auth"

  tags = {
    Name        = "S3-lambda"
    Environment = "${var.environment}"
  }
}