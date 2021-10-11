resource "aws_security_group" "ingress" {
  name        = "ingress"
  description = "SG to allow certain inbound ports"

  dynamic "ingress" {
    for_each = var.ingress_security_groups
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  tags = var.tags
}

resource "aws_security_group" "egress" {
  name        = "egress"
  description = "SG to allow general outbound connections"

  dynamic "egress" {
    for_each = var.egress_security_groups
    content {
      description = egress.value.description
      from_port   = egress.value.port
      to_port     = egress.value.port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  tags = var.tags
}
