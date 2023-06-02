terraform {
  backend "s3" {
    bucket = "devopsclasstfstatebucket"
    key    = "test/test.tfstate"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

