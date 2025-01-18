resource "aws_s3tables_namespace" "example" {
  namespace        = "example-namespace"
  table_bucket_arn = aws_s3tables_table_bucket.example.arn
}

resource "aws_s3tables_table_bucket" "example" {
  name = "example-bucket"
}

resource "aws_s3tables_table" "example" {
  name             = "example-table"
  namespace        = aws_s3tables_namespace.example.namespace
  table_bucket_arn = aws_s3tables_namespace.example.table_bucket_arn
  format           = "ICEBERG"
}

resource "aws_s3tables_table_bucket_policy" "example" {
  resource_policy  = data.aws_iam_policy_document.example.json
  table_bucket_arn = aws_s3tables_table_bucket.example.arn
}

data "aws_iam_policy_document" "example" {
  statement {
    # ...
  }
}

resource "aws_s3tables_table_policy" "example" {
  resource_policy  = data.aws_iam_policy_document.example.json
  name             = aws_s3tables_table.test.name
  namespace        = aws_s3tables_table.test.namespace
  table_bucket_arn = aws_s3tables_table.test.table_bucket_arn
}



