#The filename is simply the path to our API code block for each Lambda function
resource "aws_lambda_function" "data_reader" {
  function_name    = "${var.environment}-dr"
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_exec.arn

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
      DB_HOST = aws_db_instance.mydb.address
      DB_USER = var.db_user
      DB_PASS = var.db_pass
      DB_NAME = var.db_name
    }
  }
}

resource "aws_lambda_function" "data_writer" {
  function_name    = "${var.environment}-dw"
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_exec.arn

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
      DB_HOST = aws_db_instance.mydb.address
      DB_USER = var.db_user
      DB_PASS = var.db_pass
      DB_NAME = var.db_name
    }
  }
}

resource "aws_lambda_function" "data_driver" {
  function_name    = "${var.environment}-dd"
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_exec.arn

  filename         = "${path.module}/lambda/data-driver.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/data-reader.zip")

  timeout          = var.timeout
  memory_size      = var.memory_size
}
