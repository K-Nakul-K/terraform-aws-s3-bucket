resource "aws_s3tables_table_bucket" "this" {
  count = var.create_aws_s3_table_bucket ? 1 : 0
  name  = var.aws_s3_table_bucket_name
  maintenance_configuration {
    iceberg_unreferenced_file_removal {
      settings {
        non_current_days   = 7  # Data objects marked for deletion are deleted after 7 days.
        unreferenced_days  = 30 # Unreferenced data objects are marked for deletion after 30 days.
      }
      status = "enabled" # Enables or disables this configuration. Valid values: "enabled", "disabled".
    }
  }
}

resource "aws_s3tables_namespace" "this" {
  count            = var.create_aws_s3_table_namespace
  namespace        = local.aws_s3_table_namespace
  table_bucket_arn = local.aws_s3tables_table_bucket_arn
}

resource "aws_s3tables_table" "this" {
  name             = var.aws_s3_table_name
  namespace        = local.aws_s3_table_namespace
  table_bucket_arn = local.aws_s3tables_table_bucket_arn
  format           = "ICEBERG"
}

data "aws_iam_policy_document" "this_bucket" {
  statement {
    # TODO
  }
}

resource "aws_s3tables_table_bucket_policy" "this" {
  resource_policy  = data.aws_iam_policy_document.this_bucket.json
  table_bucket_arn = local.aws_s3tables_table_bucket_arn
}

data "aws_iam_policy_document" "this_table" {
  count = var.create_aws_s3_table_bucket && var.attach_s3table_policy ? 1 : 0
  statement {
    # TODO
  }
}

resource "aws_s3tables_table_policy" "this" {
  resource_policy  = data.aws_iam_policy_document.this_table.json
  name             = aws_s3tables_table.this.name
  namespace        = local.aws_s3_table_namespace
  table_bucket_arn = local.aws_s3tables_table_bucket_arn
}



