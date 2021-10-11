data "aws_iam_policy_document" "default_policy_document" {
  statement {
    sid    = "AssumeRole"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "sts:AssumeRole"
    ]
  }
}

resource "aws_iam_role" "default_role" {
  name               = var.policy_name
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.default_policy_document.json
}

resource "aws_iam_instance_profile" "default_instance_profile" {
  name = var.policy_name
  role = aws_iam_role.default_role.name
}
