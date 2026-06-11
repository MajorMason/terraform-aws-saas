#Per AWS, SOC 2, and Trend Micro Cloud Security recommendations, in-line IAM policies are NOT recommended
#because they are embedded directly in the IAM Role resource itself and cause said policies NOT to appear in
#the Central IAM policies listing in AWS management console (making audits difficult)
#Define the IAM Role
resource "aws_iam_role" "lambda_execution_role" {
  name = "${var.environment}-lambda-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

#The policy creates what specific action on what target resource the IAM role can perform
resource "aws_iam_policy" "lambda_logging_policy" {
  name        = "lambda-logging-policy"
  description = "Policy to allow Lambda to write logs to CloudWatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:logs:*:*:*"
      }
    ]
  })
}

#Attaches the Policy to the Role (Strictly for CloudWatch only)
resource "aws_iam_role_policy_attachment" "lambda_logs_attach" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_logging_policy.arn
}

#AWS provides a pre-defined managed policy named AWSLambdaENIManagementAccess that covers all necessary ENI actions.
#You can attach this directly without creating a new policy resource.
#AWS Managed Policy for VPC access
resource "aws_iam_role_policy_attachment" "lambda_vpc_attach" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaENIManagementAccess"
}
