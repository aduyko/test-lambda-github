variable "api_gateway_name" {
  type    = string
  default = "test-api-gateway"
}

variable "api_gateway_desc" {
  type    = string
  default = "API Gateway for triggering pipelines from github webhooks"
}

variable "lambda_function_uri" {
  type    = string
}

variable "lambda_function_name" {
  type    = string
}

variable "api_gateway_stage_name" {
  type    = string
  default = "test"
}
