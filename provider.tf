terraform {
  backend "s3" {
    bucket = "storing-the-artifacts"  # The name of your S3 bucket
    key    = "statefile/terraform.tfstate"     # The path where the state file will be stored in S3
    region = "ap-south-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.90.0"
    }
  }
}