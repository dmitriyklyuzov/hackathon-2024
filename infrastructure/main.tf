terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default" # update this later if needed
}

### S3 bucket - static website hosting ###
### S3 bucket - upload/source ###
### S3 bucket - destination/result ###
### Lambda ###
### SES ###
