# module "ec2" {
#   source = "../../modules/ec2"

#   ami_id        = var.ami_id
#   instance_type = "t3.large"
#   name          = "${var.env}-ec2"
#   env           = var.env
# }