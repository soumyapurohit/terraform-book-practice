variable "azs" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "public_subnets" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "private_subnet" {
  default = ["10.0.1.0/24","10.0.2.0/24"]
}

# variable vpc_id {
#   type = string
# }

variable "cidr_blocks" {
  default = ["107.140.55.185/32","0.0.0.0/0"]
}

# variable "db_sec_id" {
#   type = string
# }
# variable "vpc_public_subnet_ids" {
#   type = list(string)
# }