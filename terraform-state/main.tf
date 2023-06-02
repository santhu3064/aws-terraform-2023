resource "aws_s3_bucket" "state_bucket" {
  bucket = "devopsclasstfstatebucket"

  tags = {
    Name        = "tfstate"
    Environment = "test"
  }
}


resource "aws_s3_bucket_versioning" "s3_state_versioning" {
  bucket = aws_s3_bucket.state_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}