### terraform.tfvars


aws_region = "us-east-1"

environment = "prod-firewall"

key_name             = "prod-firewall-key"
iam_instance_profile = "firewall-ec2-profile"
instance_type        = "t3.medium"
root_volume_type     = "gp2"
root_volume_size     = 20
delete_on_termination = true 

# ssh_allowed_cidr = "???PUBLIC_IP/32"

tags = {
  Project     = "firewall"
  Environment = "prod-firewall"
  ManagedBy   = "terraform"
  Owner       = "Security-Team"
}


## EC2 Image Values
# ami_owners = [
#   "099720109477" # Canonical
# ]

# ami_name_pattern        = "ubuntu/images/hvm-ssd/ubuntu-noble-24.04-amd64-server-*"
# ami_virtualization_type = "hvm"
# ami_architecture        = "x86_64"


