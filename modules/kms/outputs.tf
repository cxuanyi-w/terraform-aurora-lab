output "return-kms_key_arn" {
  value = aws_kms_key.create_kms_key.arn
}

output "return-kms_key_alias" {
  value = aws_kms_key.create_kms_key.id
}
