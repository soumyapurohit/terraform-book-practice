module "networking" {
  source = "./modules/networking"
}

module "compute" {
  source = "./modules/compute"
  ec2_sg_id = module.networking.ec2_sg_id
  vpc_public_subnet_ids = module.networking.vpc_public_subnet_ids

}

module "database" {
  source = "./modules/database"
  vpc_id = module.networking.vpc_id
  db_sec_id = module.networking.db_sec_id
  private_subnet_id = module.networking.vpc_private_subnet
}