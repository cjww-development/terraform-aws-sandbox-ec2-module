variable "region" {
  type = string
  description = "The AWS region the IaC will be deployed to"
}

variable "policy_name" {
  type = string
  description = "Name for the EC2 IAM role and instance profile"
}

variable "ingress_security_groups" {
  type = list(object({
    description = string
    port = number
    protocol = string
    cidr_blocks = list(string)
  }))

  description = "Valid ingress security group rules for the instance"
}

variable "tags" {
  type = map(string)
  description = "Tags for AWS resources"
}