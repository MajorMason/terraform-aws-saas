#The filename is simply the path to our API code block for each Lambda function
resource "aws_lambda_function" "function" {
  for_each = local.functions

  function_name    = each.value.function_name
  handler          = var.handler
  runtime          = var.runtime
  role             = aws_iam_role.lambda_execution_role.arn
  filename         = "${path.module}/lambda/[for.each].zip"
  #source_code_hash = filebase64sha256("${path.module}/lambda/[for.each].zip")
  timeout          = var.timeout
  memory_size      = var.memory_size
#The subnet_ids argument list is what allows our data-reader and data-writer functions to talk securely to the RDS DB
#Dynamic blocks allow us to accomodate for variances between related resources where one may have a nested
#block such as "vpc_config" where another may only have "environment", they accomodate for empty blocks
  dynamic "vpc_config" {
    for_each = each.value.template.vpc_config == null ? [] : [each.value.template.vpc_config]
    content {
      subnet_ids         = [var.private_subnet]
      security_group_ids = [var.lambda_sg]
    }
  }
#The LAMBDA_ENDPOINT is solely used to keep inter-Lambda function coms private between all three functions
#Terraform requires the "environment" nested block to have a variables map, hence why we need the additional "variables"
#nested block within it to help out Terraform
  dynamic "environment" {
    for_each = each.value.template.environment == null ? [] : [each.value.template.environment]
    content {
      variables = {
        LAMBDA_ENDPOINT = var.lambda_interface_endpoint
        DB_HOST = var.aws_db_instance_primary
        DB_USER = var.db_username
        DB_PASS = var.db_password
        DB_NAME = var.primary_db_name
      }
    }
  }
}
#The for_each lines that leverage "?", its actually just a ternary operator which is a compact if-else expression
#so it reads as "if ingress is null, use an empty list, otherwise, use a list containing the object"
#Terraform treats the squared brackets arrangement as [OPTION A (generate ZERO blocks)] OR [OPTION B (use ingress block found in locals)]
