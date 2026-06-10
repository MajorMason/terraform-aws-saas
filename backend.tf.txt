#Similar to our previous AWS Terraform project, this one will use an ADO
#pipeline in order to deploy our IaC in a CI/CD fashion
terraform {
  backend "s3" {}
}

#Also similar to our other ADO pipeline setup, we don't need to
#specify any information in the backend config here, because its all
#being handled via pipeline variables downstream
