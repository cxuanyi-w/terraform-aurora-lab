# IAM: Create DB roles
data "aws_iam_policy_document" "key-testtestsys-access-policy" {
  #checkov:skip=CKV_AWS_109:Required KMS Access
  #checkov:skip=CKV_AWS_111:Required KMS Access
  statement {
    sid       = "Enable Cloud Admin Permissions"
    effect    = "Allow"
    actions   = ["kms:*"] # what can this key be allowed to do
    resources = ["*"]     # What resource can this key be applied to?
    principals {          # who can use this key account, service, role, user group, etc
      type = "AWS"        # This refers to "AWS Accounts" meaning under resource under IAM
      identifiers = [     #specify the specific resource from "AWS Account" aka IAM
        "arn:aws:iam::${var.input-aws_account_id}:user/${var.input-aws_account_name}",
        # "arn:aws:iam::327143400501:root",
      ]
    }
  }

  statement {
    sid       = "Enable Cloud Admin Permissions hi"
    effect    = "Allow"
    actions   = ["kms:*"]     # what can this key be allowed to do
    resources = ["*"]         # What resource can this key be applied to?
    principals {              # who can use this key account, service, role, user group, etc
      type        = "Service" # This refers to "AWS Accounts" meaning under resource under IAM
      identifiers = ["rds.amazonaws.com"]
    }
  }
}