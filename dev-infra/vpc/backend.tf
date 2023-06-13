terraform {
  backend "s3" {
    bucket         = "devopsclasstfstatebucket"
    key            = "dev/infra.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

