provider "aws" {
  region = "us-west-2"
}

# Define a list of event themes
variable "event_themes" {
  type    = list(string)
  default = ["adventure-tech", "nature-escape", "code-carnival"]
}

# Create buckets based on the event themes using count and element
resource "aws_s3_bucket" "event_buckets" {
  count = length(var.event_themes)
  bucket = "${element(var.event_themes, count.index)}-ng-bucket"
}


# Output the names of the created buckets
output "created_bucket_names" {
  value = [for bucket in aws_s3_bucket.event_buckets : bucket.bucket]
}
