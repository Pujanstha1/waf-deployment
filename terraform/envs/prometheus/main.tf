module "sg" {
  source = "../../modules/sg"

  environment      = var.environment
<<<<<<< HEAD
  vpc_id           = var.vpc_id
=======
  vpc_id      = data.terraform_remote_state.sonarqube.outputs.vpc_id
>>>>>>> 5a705e44e9fc6b2ab8f2890d51ee2887895b0a20
  tags             = var.tags
}

module "ec2" {
<<<<<<< HEAD
    source = "../../modules/ec2"

    instance_type = var.instance_type 
    subnet_id = var.subnet_id 
    sg_id = 
}
=======
  source = "../../modules/ec2"

  instance_type        = var.instance_type
  subnet_id = data.terraform_remote_state.sonarqube.outputs.public_subnet_ids[0]
  sg_id                = module.sg.security_group_id
  root_volume_type     = var.root_volume_type
  root_volume_size     = var.root_volume_size
  delete_on_termination = var.delete_on_termination
  tags                 = var.tags
  environment          = var.environment

  iam_instance_profile_name = aws_iam_instance_profile.firewall.name
}
>>>>>>> 5a705e44e9fc6b2ab8f2890d51ee2887895b0a20
