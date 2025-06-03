output "bucket_arns" {
   value = {
        for i, bucket in aws_s3_bucket.multi_region :
        var.regions[i] => bucket.arn
   }
}

output "bucket_regions" {
   value = {
      for bucket in aws_s3_bucket.multi_region :
      bucket.id = bucket.tags.Region
   }
}