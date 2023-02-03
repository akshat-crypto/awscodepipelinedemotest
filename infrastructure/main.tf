

resource "aws_instance" "demo_instance" {

  ami = "ami-01a4f99c4ac11b03c " #backstage
  instance_type = "t2.micro"   #!change
  key_name = "test"
  count = 1
  vpc_security_group_ids = [
    "sg-ec0d498e"
  ]

  tags = {
    Name = "test amis"
  }
}