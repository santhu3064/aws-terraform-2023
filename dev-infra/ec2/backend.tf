terraform {
  backend "s3" {
    bucket         = "devopsclasstfstatebucket"
    key            = "dev/ec2.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

