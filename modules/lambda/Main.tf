resource "aws_lambda_function" "tech_challenge_auth_lambda" {
  function_name = "TechChallengeAuth"

  s3_bucket = var.bucket_name
  s3_key    = "TechChallengeAuth.zip" //Pensar em usar versionamento no bucket

  handler = "TechChallengeAuth::TechChallengeAuth.LambdaEntryPoint::FunctionHandlerAsync"
  runtime = "dotnet6"

  role = aws_iam_role.lambda_exec.arn

  tags = {
    Name        = "lambda-auth"
    Environment = "${var.environment}"
  }
}

# IAM role which dictates what other AWS services the Lambda function
# may access.
resource "aws_iam_role" "lambda_exec" {
  name = "auth_lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
