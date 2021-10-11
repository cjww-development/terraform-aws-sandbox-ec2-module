variable "region" {
  type        = string
  description = "The AWS region the IaC will be deployed to"
}

variable "policy_name" {
  type        = string
  description = "Name for the EC2 IAM role and instance profile"
}

variable "ingress_security_groups" {
  type = list(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  description = "Valid ingress security group rules for the instance"
}

variable "egress_security_groups" {
  type = list(object({
    description = string
    port        = number
    protocol    = string
    cidr_blocks = list(string)
  }))

  description = "Valid egress security group rules for the instance"
}

variable "tags" {
  type        = map(string)
  description = "Tags for AWS resources"
}

variable "ec2_instance_type" {
  type        = string
  description = "EC2 Instance type to be used e.g. t2.micro"
}

variable "user_data_file_path" {
  type        = string
  description = "Path to the user data file used to initialise the instance"
}

variable "public_key_path" {
  type        = string
  description = "Path to the SSH public key file"
}
