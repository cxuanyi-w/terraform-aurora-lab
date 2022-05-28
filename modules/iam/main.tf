# # IAM: Create policy to enable RDS DB to use IAM authentication 
# data "aws_iam_policy_document" "create_" {
  
#   statement {
#     sid       = "Enable user to use the key"
#     effect    = "Allow"
#     actions   = ["rds-db:connect"] # what can this key be allowed to do
#     resources = ["arn:aws:rds-db:<REGION>:<AWS_ACCOUNT_ID>:dbuser:<DB_RESOURCE_ID>/<DB_USERNAME>"]     # What resource can this key be applied to?
#     principals {          # who can use this key account, service, role, user group, etc
#       type = "AWS"        # This refers to "AWS Accounts" meaning under resource under IAM
#       identifiers = [     #specify the specific resource from "AWS Account" aka IAM
#         "arn:aws:iam::${var.input-aws_account_id}:user/${var.input-aws_account_name}"  # this is the programmatic user with the rights
#       ]
#     }
#   }
# }
