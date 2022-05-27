# IAM: Add new policy to the KMS key
data "aws_iam_policy_document" "create-kms-key-for-rds" {
  #checkov:skip=CKV_AWS_109:Required KMS Access
  #checkov:skip=CKV_AWS_111:Required KMS Access

  # This part of the policy allow a [specifc user] to perform [all kms action] to the key
  # of which the policy is attached to.
  statement {
    sid       = "Enable user to use the key"
    effect    = "Allow"
    actions   = ["kms:*"] # what can this key be allowed to do
    resources = ["*"]     # What resource can this key be applied to?
    principals {          # who can use this key account, service, role, user group, etc
      type = "AWS"        # This refers to "AWS Accounts" meaning under resource under IAM
      identifiers = [     #specify the specific resource from "AWS Account" aka IAM
        "arn:aws:iam::${var.input-aws_account_id}:user/${var.input-aws_account_name}"  # this is the programmatic user with the rights
      ]
    }
  }

  # This part of the policy to allow [the key with this policy attached] to be used on RDS
  statement {
    sid       = "Enable Cloud Admin Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]     # what can this key be allowed to do
    resources = ["*"]         # What resource can this key be applied to?
    principals {              # who can use this key account, service, role, user group, etc
      type        = "Service" # This refers to "AWS Accounts" meaning under resource under IAM
      identifiers = ["rds.amazonaws.com"]
    }
  }
}

resource "aws_kms_key" "create_kms_key" {
  description             = "This key is used to encrypt S3 Bucket used to store the Terraform State"
  deletion_window_in_days = 7
  policy                  = data.aws_iam_policy_document.create-kms-key-for-rds.json
}

resource "aws_kms_alias" "key-testtestsys-s3-terraform-state-alias" {
  name          = "alias/${var.input-kms_key_alias}"
  target_key_id = aws_kms_key.create_kms_key.key_id
}
