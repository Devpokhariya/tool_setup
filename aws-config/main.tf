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