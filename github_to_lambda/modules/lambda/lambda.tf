resource "aws_lambda_function" "lambda_function" {
  filename      = var.lambda_filename
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda.arn
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime

  depends_on    = [aws_iam_role_policy_attachment.lambda_logs, aws_cloudwatch_log_group.log_group]
}
