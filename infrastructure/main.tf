

resource "aws_instance" "demo_instance" {
  ami      = "ami-06984ea821ac0a879"
  # ami = "ami-06984ea821ac0a879 " #backstage
  instance_type = "t2.micro"   #!change
  key_name = "derek_pc"
  count = 1
  vpc_security_group_ids = [
    "sg-ec0d498e"
  ]

  tags = {
    Name = "test amis demo"
  }
}