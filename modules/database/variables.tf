variable "engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.0"
}

variable "family" {
  type = string
  default = "mysql8.0"
}

variable "instance_class" {
  type = string
  default = "db.t3.micro"
}

variable "allocated_storage" {
  type = string
  default = 5
}

variable "username" {
  type = string
  default = "user"
}
variable "db_sec_id" {
  type = string
}

variable "vpc_id" {
  type = string
}

# variable "db_instance_endpoint" {
#   type = string
# }

variable "private_subnet_id" {
  type = list(string)
}
variable "db_subnet_group_name" {
  type = string
  default = "rdssubnet"
}