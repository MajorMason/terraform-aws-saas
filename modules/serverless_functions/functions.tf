#The filename is simply the path to our API code block for each Lambda function
resource "aws_lambda_function" "data_reader" {
  function_name    = "${var.environment}-dr"
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_execution_role.arn

  filename         = "${path.module}/lambda/data-reader.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/data-reader.zip")

  timeout          = var.timeout
  memory_size      = var.memory_size

  vpc_config {
    subnet_ids         = [var.private_subnet]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  environment {
    variables = {
      LAMBDA_ENDPOINT = aws_vpc_endpoint.lambda_interface_endpoint.dns_entry[0].dns_name
      DB_HOST = var.aws_db_instance_primary
      DB_USER = var.db_username
      DB_PASS = var.db_password
      DB_NAME = var.primary_db_name
    }
  }
}

resource "aws_lambda_function" "data_writer" {
  function_name    = "${var.environment}-dw"
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_execution_role.arn

  filename         = "${path.module}/lambda/data-writer.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/data-reader.zip")

  timeout          = var.timeout
  memory_size      = var.memory_size

  vpc_config {
    subnet_ids         = [var.private_subnet]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

  environment {
    variables = {
      LAMBDA_ENDPOINT = aws_vpc_endpoint.lambda_interface_endpoint.dns_entry[0].dns_name
      DB_HOST = var.aws_db_instance_primary
      DB_USER = var.db_username
      DB_PASS = var.db_password
      DB_NAME = var.primary_db_name
    }
  }
}

resource "aws_lambda_function" "data_driver" {
  function_name    = "${var.environment}-dd"
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_execution_role.arn

  filename         = "${path.module}/lambda/data-driver.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/data-reader.zip")

  timeout          = var.timeout
  memory_size      = var.memory_size

  environment {
    variables = {
      LAMBDA_ENDPOINT = aws_vpc_endpoint.lambda_interface_endpoint.dns_entry[0].dns_name
    }
  }
}
