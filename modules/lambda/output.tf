output "lambda_invoke_arn" {
  description = "The arn of lambda to create api gateway"
  value       = aws_lambda_function.tech_challenge_auth_lambda.invoke_arn
}

output "lambda_function_name" {
  description = "The lambda function name"
  value       = aws_lambda_function.tech_challenge_auth_lambda.function_name
}