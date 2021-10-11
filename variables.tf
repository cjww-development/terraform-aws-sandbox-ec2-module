variable "region" {
  type = string
  description = "The AWS region the IaC will be deployed to"
}

variable "policy_name" {
  type = string
  description = "Name for the EC2 IAM role and instance profile"
}