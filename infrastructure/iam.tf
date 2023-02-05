resource "aws_iam_role" "s3_full_access_role" {
  name = "s3_full_access_role"

  assume_role_policy = jsonencode({
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
})


}

resource "aws_iam_policy" "s3_full_access_policy" {
  name = "s3_full_access_policy"
  #!Change the policy if bucket name is different -  s3 mount problem resolve
  policy = jsonencode(
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::moderndatastacprivate",
        "arn:aws:s3:::moderndatastacprivate/*",
      ]
    }
  ]
})

}

resource "aws_iam_role_policy_attachment" "s3_full_access_attachment" {
  role = aws_iam_role.s3_full_access_role.name
  policy_arn = aws_iam_policy.s3_full_access_policy.arn
}

resource "aws_iam_instance_profile" "s3_full_access_profile" {
  name = "s3_demo_access_profile"
  role = aws_iam_role.s3_full_access_role.name
}