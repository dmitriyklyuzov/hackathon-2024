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
  acl                     = "public-read"
  policy                  = data.aws_iam_policy_document.s3_bucket_policy.json
  attach_policy           = true
  website = {
    index_document = "index.html"
  }
}

data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"

    actions = [
      "s3:GetObject"
    ]

    resources = [
      "${module.s3_website.s3_bucket_arn}/*"
    ]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}

### Static website source code
resource "aws_s3_object" "index_html" {
  bucket       = module.s3_website.s3_bucket_id
  key          = "index.html"
  source       = "../static-website/index.html"
  content_type = "text/html"
}

### S3 bucket - upload/source ###
### S3 bucket - destination/result ###
### Lambda ###
### SES ###
