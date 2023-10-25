output "bucket_name" {
  description = "the name of s3 Bucket"
  value       = aws_s3_bucket.lambda_s3.bucket
}