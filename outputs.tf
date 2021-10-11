output "policy_name" {
  value = aws_iam_role.default_role.name
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.default_instance_profile.name
}