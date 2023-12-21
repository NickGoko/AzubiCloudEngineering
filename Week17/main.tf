provider "aws" {
  region = "us-west-2" 
}

resource "aws_s3_bucket" "bucket" {
  bucket = "unique-bucket-name" 
  acl    = "public-read"        # Set ACL to public-read to allow public access

  versioning {
    enabled = true              # Enable versioning
  }

  website {
    index_document = "index.html" # Assuming index.html is your main HTML file
    error_document = "error.html" # Provide an error HTML file
  }
}

output "bucket_endpoint" {
  value = aws_s3_bucket.bucket.website_endpoint # Outputs the website endpoint
}
