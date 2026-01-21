module "vpc" {
  source = "./modules/vpc"
  # vpc
  vpc_name       = var.environment
  vpc_cidr_block = var.vpc_cidr

  # az 
  number_of_az = var.number_of_az
  vpc_azs      = var.vpc_azs

  # public subnets
  number_of_public_subnets  = var.number_of_public_subnets
  public_subnets_cidr_block = var.public_subnets_cidr_block

  # private subnets
  number_of_private_subnets  = var.number_of_private_subnets
  private_subnets_cidr_block = var.private_subnets_cidr_block
}

module "sg" {
  source = "./modules/sg"

  environment      = var.environment
  vpc_id           = module.vpc.vpc_id
  ssh_allowed_cidr = var.ssh_allowed_cidr
  tags             = var.tags
}

module "ec2" {
  source = "./modules/ec2"

  key_name              = var.key_name
  subnet_id             = module.vpc.public_subnets[0].id
  sg_id                 = module.sg.security_group_id
  iam_instance_profile  = var.iam_instance_profile   
  instance_type         = var.instance_type
  root_volume_type      = var.root_volume_type 
  environment           = var.environment            
  tags                  = var.tags
  root_volume_size      = var.root_volume_size
  delete_on_termination = var.delete_on_termination
}