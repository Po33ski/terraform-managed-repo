variable "region" {
   type    = string
   description = "Region of the bucket"
}

variable "bucket_name_prefix" {
  type    = string
  description = "Prefix for the bucket"
}

variable "random_suffix" {
  type    = string
  description = "Sufix for the bucket"
}

variable "lifecycle_days" {
  type    = number
  default = 90
}

variable "lifecycle_storage_class" {
  type    = string
  default = "GLACIER"
  description = "Storage class for the bucket"
}