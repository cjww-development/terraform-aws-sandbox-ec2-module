resource "aws_security_group" "ingress" {
  for_each = {for rule in var.ingress_security_groups:  rule.description => rule}

  name = "ingress-on-${each.value.port}"
  description = each.value.description

  ingress {
    description = each.value.description
    from_port = each.value.port
    to_port   = each.value.port
    protocol  = each.value.protocol
    cidr_blocks = each.value.cidr_blocks
  }

  tags = var.tags
}