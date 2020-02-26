variable "lambda_function_name" {
  type    = string
  default = "test-lambda-function"
}

variable "lambda_filename" {
  type    = string
  default = "modules/lambda/dist/lambda_function.zip"
}

variable "lambda_handler" {
  type    = string
  default = "read_github_webhook.lambda_handler"
}

variable "lambda_runtime" {
  type    = string
  default = "python2.7"
}
