
############ PROVIDER BLOCK ############
provider "aws" {
  region     = "us-east-1"
  profile    = "default"
}
############ SAVING TF STATE FILE #########
terraform {
  backend "s3" {
    bucket  = "terraform-atlantis-infracost-workflow-01"
    key     = "terraform-statefile/terraform.tfstate"
    region  = "us-east-1"
    profile = "default"
  }
}
################# S3 Bucket CREATION #########
resource "aws_s3_bucket" "my-test" {
  bucket = "terraform-atlantis-infracost-workflow-02"

  tags = {
    User        = "test-user"
    Environment = "Dev"
    Createdby = "Atlantis terraform Workflow"
  }
}
}
