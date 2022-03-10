### Terraform Variables ###

variable "region" {
  type    = string
  default = "us-east-1"

}

## Bucket

variable "bucket_name" {

  type    = string
  default = "terraform-backend-demo-gft"
}

## Dynamo

variable "dynamodb_table_name" {

  type    = string
  default = "terraform-state-lock"
}