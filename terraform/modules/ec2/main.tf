############################
# AMI Lookup
############################

data "aws_ami" "custom-image" {
  most_recent = var.ami_most_recent
  owners      = var.ami_owners

  filter {
    name   = "name"
    values = [var.ami_name_pattern]
  }

  filter {
    name   = "virtualization-type"
    values = [var.ami_virtualization_type]
  }

  filter {
    name   = "architecture"
    values = [var.ami_architecture]
  }
}


############################
# EC2 Instance
############################

resource "aws_instance" "this" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type #"t3.medium"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile   = var.iam_instance_profile #aws_iam_instance_profile.firewall.name
  key_name               = var.key_name

  root_block_device {
    volume_type           = var.root_volume_type #"gp2"
    volume_size           = var.root_volume_size #20
    delete_on_termination = var.delete_on_termination #true
  }

  credit_specification {
    cpu_credits = var.cpu_credits  #"standard"
  }

  tags = merge(
    var.tags,
    { Name = "${var.environment}-ec2" }
  )
}

######## Attaching EIP to the instance #############
resource "aws_eip" "this" {
  count    = var.enable_eip ? 1 : 0
  instance = aws_instance.this.id
  domain   = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-eip"
    }
  )
}