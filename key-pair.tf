resource "aws_key_pair" "ssh" {
  key_name   = "ssh-access-key"
  public_key = file(var.public_key_path)
}
