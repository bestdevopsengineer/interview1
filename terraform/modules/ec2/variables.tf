variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.large"
}

variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
}