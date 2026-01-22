variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod-firewall"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "number_of_az" {
  description = "Number of availability zone for vpc"
  type        = number
  default     = 1
}

variable "vpc_azs" {
  description = "Availability zone"
  type        = list(string)
  default     = ["us-east-1"]
}

variable "number_of_public_subnets" {
  description = "Number of public subnets to create"
  type        = number
  default     = 1
}

variable "public_subnets_cidr_block" {
  description = "Public subnets cidr blocks"
  type        = list(string)
  default     = ["10.0.0.0/28"]
}

variable "number_of_private_subnets" {
  description = "Number of private subnets to create"
  type        = number
  default     = 0
}

variable "private_subnets_cidr_block" {
  description = "Private subnets cidr blocks"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  default = {
    Project     = "firewall"
    Environment = "prod-firewall"
    ManagedBy   = "terraform"
  }
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to SSH into EC2"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile name for EC2"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "root_volume_type" {
  description = "Root Volume Type for EC2"
  type        = string   
}

variable "root_volume_size" {
  description = "Size of the Root Volume"
  type        = number
}

variable "delete_on_termination" {
  description = "Delete root EBS volume on EC2 termination"
  type        = bool
}


## Variables for EC2 Image

# variable "ami_owners" {
#   description = "AMI owners"
#   type        = list(string)
# }

# variable "ami_name_pattern" {
#   description = "AMI name filter"
#   type        = string
# }

# variable "ami_virtualization_type" {
#   description = "AMI virtualization type"
#   type        = string
#   default     = "hvm"
# }

# variable "ami_architecture" {
#   description = "AMI architecture"
#   type        = string
#   default     = "x86_64"
# }
