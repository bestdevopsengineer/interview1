data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "tlp-jou-dev"
    key    = "terraform/aws/vpc/dev.tfstate"
    region = "us-east-1"
  }
}

module "security_group" {
  source = "../../modules/security-group"

  env    = var.env
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
}

module "ec2" {
  source = "../../modules/ec2"

  ami_id        = var.ami_id
  instance_type = "t3.large"
  name          = "${var.env}-docker-host"
  env           = var.env

  subnet_id          = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  security_group_id  = module.security_group.security_group_id

}

