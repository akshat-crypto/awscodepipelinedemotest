resource "aws_s3_bucket" "moderndatastack" {
  bucket = "mdsprivate911"
  lifecycle {
    prevent_destroy = false
  }
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning_moderndatastack" {
  bucket = aws_s3_bucket.moderndatastack.id
  versioning_configuration {
    status = "Enabled"
  }
}

# resource "aws_s3_object" "moderndatastackupload" {
#   for_each = fileset("../s3obj/", "**")
#   bucket = aws_s3_bucket.moderndatastack.id
#   key = each.value
#   source = "../s3obj/${each.value}"
#   etag = filemd5("../s3obj/${each.value}")
# }