##########
# API Gateway
##########

resource "aws_api_gateway_rest_api" "api" {
  name        = var.api_gateway_name
  description = var.api_gateway_desc
}

resource "aws_api_gateway_method" "root" {
   rest_api_id   = aws_api_gateway_rest_api.api.id
   resource_id   = aws_api_gateway_rest_api.api.root_resource_id
   http_method   = "POST"
   authorization = "NONE"
}

resource "aws_api_gateway_integration" "lambda" {
   rest_api_id = aws_api_gateway_rest_api.api.id
   resource_id = aws_api_gateway_method.root.resource_id
   http_method = aws_api_gateway_method.root.http_method

   integration_http_method = "POST"
   type                    = "AWS_PROXY"
   uri                     = var.lambda_function_uri
}

##########
# API Gateway Deployment
##########

resource "aws_api_gateway_deployment" "deployment" {
   rest_api_id = aws_api_gateway_rest_api.api.id
   stage_name  = var.api_gateway_stage_name

   depends_on = [aws_api_gateway_integration.lambda]
}

resource "aws_lambda_permission" "apigw" {
   statement_id  = "AllowAPIGatewayInvoke"
   action        = "lambda:InvokeFunction"
   function_name = var.lambda_function_name
   principal     = "apigateway.amazonaws.com"

   source_arn = "${aws_api_gateway_rest_api.api.execution_arn}/*/*"
}

output "api_url" {
  value = aws_api_gateway_deployment.deployment.invoke_url
}
