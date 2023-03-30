output "public_ip" { 
  //value = module.ec2_instance.public_ip
  value = values(module.ec2_instance)[*].public_ip
}