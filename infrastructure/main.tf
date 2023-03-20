resource "aws_instance" "test_instance" {
  ami = "ami-0f8ca728008ff5af4" #backstage
  instance_type = "t2.micro"   #!change
  key_name = "derek_pc"
  count = 1
  vpc_security_group_ids = [
  #!change to individual sgs here
    "sg-ec0d498e"
  ]

  tags = {
    Name =  terraform.workspace == "dev" ? "${var.mdsec2}-dev" : "${var.mdsec2}-prod"
  }
}

resource "aws_s3_bucket" "pipeline_artifacts" {
   bucket = terraform.workspace == "dev" ? "${var.mdsdatakedro}-dev" : "${var.mdsdatakedro}-prod"
  # versioning {
  #   enabled = true
  # }
  lifecycle {
    prevent_destroy = false
  }
  force_destroy = true
  
}