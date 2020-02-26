provider "aws" {
  region = var.aws_region
}

module "lambda" {
  source = "./modules/lambda"

  lambda_function_name = var.lambda_function_name
}

module "api_gateway" {
  source = "./modules/api_gateway"

  lambda_function_name  = var.lambda_function_name
  lambda_function_uri   = module.lambda.lambda_function_uri
}

output "api_gateway_url" {
  value = module.api_gateway.api_url
}
