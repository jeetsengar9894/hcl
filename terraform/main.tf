resource "aws_iam_role" "lambda_role" {
    name = "lambdarole_apigateway"
    assume_role_policy = data.aws_iam_role_policy_document.assume_role.json
  }

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_ecrpublic_repository" "my_registery" {
    repository_name = "myrepository" 
}

resource "aws_lambda_function" "my_function" {
    function_name = "lambda_microservice_30may"
    timeout = 900
    role = aws_iam_role.lambda_role.arn
    memory_size = 1024
    description = "lambda function for microservice"
    runtime = "nodejs18.x" 
    filename    = "lambda_code.zip"
    depends_on = [ aws_iam_role.lambda_role ]
}

