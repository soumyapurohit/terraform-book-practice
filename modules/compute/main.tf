module ec2_instance {
    source = "terraform-aws-modules/ec2-instance/aws"
    for_each = {for key, value in var.vpc_public_subnet_ids : key => value}
    name = "my-instance"

    #ami = var.ami
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [var.ec2_sg_id]

    associate_public_ip_address = true

    subnet_id = each.value
    
}