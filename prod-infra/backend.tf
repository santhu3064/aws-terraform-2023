terraform {
  backend "s3" {
    bucket         = "devopsclasstfstatebucket"
    key            = "prod/vpc.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

