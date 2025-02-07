terraform {
  backend "s3" {
  bucket = "82s-devopsyugam-state"
  key = "ec2-demo-backend-infra"  # It should be unique within the bucket and same key not recomended to use another bucket
  dynamodb_table = "82s-devopsyugam-state"
  region = "us-east-1"  
}
}