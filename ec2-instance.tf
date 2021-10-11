data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "sandbox_instance" {
  ami           = data.aws_ami.amazon_linux_2.id
  instance_type = var.ec2_instance_type

  vpc_security_group_ids = [
    aws_security_group.ingress.id,
    aws_security_group.egress.id
  ]

  subnet_id = aws_default_subnet.default_subnet_a.id

  iam_instance_profile = aws_iam_instance_profile.default_instance_profile.name

  user_data = file(var.user_data_file_path)

  monitoring = true

  tags = var.tags
}

resource "aws_eip" "sandbox_instance" {
  vpc      = true
  instance = aws_instance.sandbox_instance.id
}