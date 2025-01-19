locals {
  aws_s3tables_table_bucket_arn = var.create_aws_s3_table_bucket ? aws_s3tables_table_bucket.this.arn : var.aws_s3tables_table_bucket_arn
  aws_s3_table_namespace        = var.aws_s3_table_namespace
}
