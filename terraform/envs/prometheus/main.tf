module "sg" {
  source = "../../modules/sg"

  environment      = var.environment
  vpc_id           = var.vpc_id
  tags             = var.tags
}

module "ec2" {
    source = "../../modules/ec2"

    instance_type = var.instance_type 
    subnet_id = var.subnet_id 
    sg_id = 
}