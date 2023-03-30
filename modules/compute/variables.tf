variable "ami" {
  type = string
  default = "ami-02f97949d306b597a"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2_sg_id" {
  type = string
}

variable "vpc_public_subnet_ids" {
  type = list(string)
}