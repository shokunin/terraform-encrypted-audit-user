resource "aws_iam_group" "tf-auditors" {
  name = "tf-auditors"
  path = "/tf-auditors/"
}

resource "aws_iam_user" "auditor" {
  name = "auditor"
  path = "/tf-auditors/"
}

resource "aws_iam_access_key" "auditor" {
  user    = "${aws_iam_user.auditor.name}"
  pgp_key = "keybase:${var.keybase-user}"
}

resource "aws_iam_group_membership" "tf-auditors" {
  name = "tf-auditors-group-membership"

  users = [
    "${aws_iam_user.auditor.name}",
  ]

  group = "${aws_iam_group.tf-auditors.name}"
}

resource "aws_iam_group_policy" "tf-auditors-policy" {
  name  = "tf-auditors-policy"
  group = "${aws_iam_group.tf-auditors.id}"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "apigateway:GET",
                "application-autoscaling:Describe*",
                "autoscaling:Describe*",
                "batch:List*",
                "batch:Describe*",
                "cloudfront:Get*",
                "cloudfront:List*",
                "cloudhsm:List*",
                "cloudhsm:Describe*",
                "cloudhsm:Get*",
                "cloudsearch:Describe*",
                "cloudsearch:List*",
                "cloudtrail:Describe*",
                "cloudtrail:Get*",
                "cloudtrail:List*",
                "cloudtrail:LookupEvents",
                "cloudwatch:Describe*",
                "cloudwatch:Get*",
                "cloudwatch:List*",
                "codedeploy:BatchGet*",
                "codedeploy:Get*",
                "codedeploy:List*",
                "codepipeline:List*",
                "codepipeline:Get*",
                "codestar:List*",
                "codestar:Describe*",
                "codestar:Get*",
                "codestar:Verify*",
                "config:Deliver*",
                "config:Describe*",
                "config:Get*",
                "config:List*",
                "connect:List*",
                "connect:Describe*",
                "connect:Get*",
                "dms:Describe*",
                "dms:List*",
                "dms:Test*",
                "ds:Check*",
                "ds:Describe*",
                "ds:Get*",
                "ds:List*",
                "ds:Verify*",
                "dynamodb:BatchGet*",
                "dynamodb:Describe*",
                "dynamodb:Get*",
                "dynamodb:List*",
                "dynamodb:Query",
                "dynamodb:Scan",
                "ec2:Describe*",
                "ec2:Get*",
                "ec2messages:Get*",
                "elasticache:Describe*",
                "elasticache:List*",
                "elasticfilesystem:Describe*",
                "elasticloadbalancing:Describe*",
                "es:List*",
                "es:ESHttpGet",
                "es:ESHttpHead",
                "events:Describe*",
                "events:List*",
                "events:Test*",
                "firehose:Describe*",
                "firehose:List*",
                "glacier:List*",
                "glacier:Describe*",
                "glacier:Get*",
                "kinesisanalytics:Describe*",
                "kinesisanalytics:Discover*",
                "kinesisanalytics:Get*",
                "kinesisanalytics:List*",
                "kinesis:Describe*",
                "kinesis:Get*",
                "kinesis:List*",
                "kms:Describe*",
                "kms:Get*",
                "kms:List*",
                "lambda:List*",
                "lambda:Get*",
                "lex:Get*",
                "rds:Describe*",
                "rds:List*",
                "rds:Download*",
                "redshift:Describe*",
                "redshift:View*",
                "redshift:Get*",
                "route53:Get*",
                "route53:List*",
                "route53:Test*",
                "route53domains:Check*",
                "route53domains:Get*",
                "route53domains:List*",
                "route53domains:View*",
                "s3:Get*",
                "s3:List*",
                "s3:Head*",
                "xray:BatchGet*",
                "xray:Get*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
  }
EOF
}
