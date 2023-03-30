module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "my-vpc"
  cidr   = "10.0.0.0/16"

  azs    = var.azs
  public_subnets = var.public_subnets
  private_subnets = var.private_subnet

  tags = {
      Terraform = "true"
      Environment = "dev"
  }

}

resource "aws_security_group" "ec2_sg" {
  name = "ec2_security_group"
  description = "Allow ec2 instance to have inbound and outbound connection"
  vpc_id = module.vpc.vpc_id // we will get this after vpc module is deployed and its referenced from the output variable

  ingress {
      description = "Inbound SSH traffic from local"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [var.cidr_blocks[0]]
  }

  egress {
      description = "Outbound traffic to public internet"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [var.cidr_blocks[1]]
  }
}

resource "aws_security_group" "db_sg" {
  name = "db_security_group"
  description = "Allow db instancr to have inbound and outbound connection from ec2 instance"
  vpc_id = module.vpc.vpc_id

  ingress {
      description = "Inbound Ec2 instance traffic"
      from_port = 3306
      to_port = 3306
      protocol = "tcp"
      security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
      description = "Outbound db traffic"
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = [var.cidr_blocks[1]]
  }
}