variable "aws_region" {
  type = string
  description = "AWS region to create resources"
  default = "eu-west-3"

}

variable "vpc_id" {
  type = string
  description = "VPC for Jenkins"
  default = "vpc-093558910d86619d7"
}

variable "cidr_block" {
  type = string
  description = "CIDR Block to allow Jenkins Access"
  default = "0.0.0.0/0"
}

variable "key_name" {
  type = string
  description = "Name of keypair to ssh"
  default = "jenkins-server.pem"
}

variable "image_id" {
  type = string
  description = "The id of the machine image (AMI) to use for the server."
  default = "ami-03c351a3de8084aec"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default = "t3.small"
}