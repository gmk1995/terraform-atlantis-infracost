############ PROVIDER BLOCK ############
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "terraform-atlantis-infracost-workflow-03"
    key     = "atlantis/terraform.tfstate"
    region  = "ap-southeast-2"
    profile = "default"
  }
}
################# EC2 INSTANCE CREATION #########
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"

  tags = {
    Name        = "terraform-atlantis"
    Environment = "dev"
    Owner       = "platform-team"
    CostCenter  = "cc-001"
  }
}
