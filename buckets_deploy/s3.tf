resource "random_id" "bucket_suffix" {
  count       = length(var.regions) # notice new option - it will create N resources that can be accesses by [index] 
  #Count creates separate instances of this resource depending (in this example) on amount of regions
  byte_length = 4
}

resource "aws_s3_bucket" "multi_region" {
  count   = length(var.regions)
  bucket = "${var.bucket_name_prefix}-${var.regions[count.index]}-${random_id.bucket_suffix[count.index].hex}"
  provider = count.index == 0 ? aws : aws.us_west_2

  tags = {
    Region = var.regions[count.index]
  }

}

resource "aws_s3_bucket_versioning" "this" {
  count   = length(var.regions)
  bucket = aws_s3_bucket.multi_region[count.index].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  count   = length(var.regions)
  bucket = aws_s3_bucket.multi_region[count.index].id

  rule {
    id     = "transition-to-glacier"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER_IR"
    }
  }
}


