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

locals {
  project_name = "calcurator"
}

### S3 bucket - static website hosting ###
module "s3_website" {
  source                  = "terraform-aws-modules/s3-bucket/aws"
  bucket                  = "${local.project_name}-static-website"
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  website = {
    index_document = "index.html"
  }
}

### Static website source code
resource "aws_s3_object" "index_html" {
  bucket = module.s3_website.s3_bucket_id
  key    = "index.html"
  source = "../static-website/index.html"
  acl    = "public-read"
}

### S3 bucket - upload/source ###
### S3 bucket - destination/result ###
### Lambda ###
### SES ###
