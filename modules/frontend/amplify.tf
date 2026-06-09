#AWS Amplify automatically handles SSL certificates, scaling, and CDN distribution via CloudFront.
resource "aws_amplify_app" "amplify_app" {
  name       = "${var.environment}-amplify-app"
  repository = var.repository
  access_token = var.github_token
  enable_branch_auto_build = true
}

resource "aws_amplify_branch" "amplify_branch" {
  app_id      = aws_amplify_app.amplify_app.id
  branch_name = "main"
}
