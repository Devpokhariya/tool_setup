provider "aws" {
  region  = var.region
  profile = "default"
}


resource "aws_config_configuration_recorder_status" "test-recorder-status" {
  name       = aws_config_configuration_recorder.aws-config-record-test.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.s3-delivery-channel]
}

resource "aws_iam_role_policy_attachment" "attach-test-role" {
  role       = aws_iam_role.test-role-config.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSConfigRole"
}

resource "aws_s3_bucket" "sinc-prthap-vrf-tst" {
  bucket = "awsconfig-example-prathap-test"
  force_destroy = true
}

resource "aws_config_delivery_channel" "s3-delivery-channel" {
  name           = "s3-delivery-channel-prathap"
  s3_bucket_name = aws_s3_bucket.sinc-prthap-vrf-tst.bucket
}

resource "aws_config_configuration_recorder" "aws-config-record-test" {
  name     = "aws-config-record-test"
  role_arn = aws_iam_role.test-role-config.arn
}

resource "aws_iam_role" "test-role-config" {
  name = "example-awsconfig"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "config.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy" "aws-config-policy" {
  name = "awsconfig-test-policy"
  role = aws_iam_role.test-role-config.id

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.sinc-prthap-vrf-tst.arn}",
        "${aws_s3_bucket.sinc-prthap-vrf-tst.arn}/*"
      ]
    }
  ]
}
POLICY
}
resource "aws_organizations_organization" "example" {
  aws_service_access_principals = ["config-multiaccountsetup.amazonaws.com"]
  feature_set                   = "ALL"
}

resource "aws_config_organization_managed_rule" "s3-public-compliance-rule" {
  depends_on = [aws_organizations_organization.example]

  name            = "s3-public-compliance-rule"
  rule_identifier = "S3_BUCKET_LEVEL_PUBLIC_ACCESS_PROHIBITED"
}

############### Volume encryption EC2 ################

resource "aws_config_organization_managed_rule" "ec2-volume-encryption-rule" {
  depends_on = [aws_organizations_organization.example]

  name            = "ec2-volume-encryption-rule"
  rule_identifier = "ENCRYPTED_VOLUMES"
}


############### restrict  Incoming SSH  ################

resource "aws_config_organization_managed_rule" "restrict-incoming-ssh-rule" {
  depends_on = [aws_organizations_organization.example]

  name            = "restrict-incoming-ssh-rule"
  rule_identifier = "INCOMING_SSH_DISABLED"
}



############### restrict  default traffic to VPC   ################

resource "aws_config_organization_managed_rule" "restrict-default-traffic-vpc-rule" {
  depends_on = [aws_organizations_organization.example]

  name            = "restrict-default-traffic-vpc-rule"
  rule_identifier = "VPC_DEFAULT_SECURITY_GROUP_CLOSED"
}

