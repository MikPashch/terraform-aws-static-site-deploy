#__define providers__
# 
provider "aws" {
  region = "eu-north-1" # select your preferred region
}



#__create S3 bucket resources for our static web site__

# create bucket
resource "aws_s3_bucket" "contact-form-static-website" {
  bucket = "contact-form-static-website" # give a unique bucket name
  tags = {
    Name = "contact-form-static-website"
  }
}

resource "aws_s3_bucket_website_configuration" "contact-form-static-website" {
  bucket = aws_s3_bucket.contact-form-static-website.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_versioning" "contact-form-static-website" {
  bucket = aws_s3_bucket.contact-form-static-website.id
  versioning_configuration {
    status = "Enabled"
  }
}

# S3 public access
resource "aws_s3_bucket_public_access_block" "contact-form-static-website" {
  bucket = aws_s3_bucket.contact-form-static-website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# S3 bucket policy
resource "aws_s3_bucket_policy" "contact-form-static-website" {
  bucket = aws_s3_bucket.contact-form-static-website.id

  policy = templatefile("s3bucketpolicies.json.tpl", {
    backetname = "contact-form-static-website", }
  )
}



#__create lambda resources__



#__create API-Gateway  resources__
