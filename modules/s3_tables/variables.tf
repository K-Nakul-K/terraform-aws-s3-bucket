variable "aws_s3_table_bucket_name" {
  description = "Set the name of the S3 backup bucket"
  type        = string
}

variable "create_aws_s3_table_bucket" {
  description = "Provide false if table bucket already present"
  type = bool
  default = true
}

variable "aws_s3tables_table_bucket_arn" {
  description = "Provide the ARN of an existing S3 bucket. Make sure the bucket already exists and was created outside of this module."
  type = string
  default = null
}

variable "aws_s3_table_namespace" {
  description = "Name of the namespace for s3 table."
  type = string
}

variable "create_aws_s3_table_namespace" {
  description = "Provide false if namespace already exists"
  type = bool
  default = true
}

variable "aws_s3_table_name" {
  description = "Name of the namespace for S3 table."
  type = string
}

variable "attach_s3table_policy" {
  description = "Controls if S3 bucket should s3 tables have table policy policy attached"
  type = bool
  default = true
}
