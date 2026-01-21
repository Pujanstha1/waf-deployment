variable "environment" {
  description = "Environment name (dev, stage, prod, qa)"
  type        = string
  # default     = "prod-firewall"
}


variable "tags" {
  description = "Common resource tags"
  type        = map(string)
  # default = {
  #   Project     = "firewall"
  #   Environment = "prod-firewall"
  #   ManagedBy   = "terraform"
  # }
}


variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be launched"
  type        = string
}


variable "sg_id" {
  type = string
  description = "Security Group ID where the web server will be deployed"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  # default     = "t3.medium"
}


variable "iam_instance_profile" {
  description = "IAM instance profile name"
  type        = string
}


variable "root_volume_type" {
  description = "Root EBS volume type"
  type        = string
  # default     = "gp2"

  validation {
    condition     = contains(["gp2", "gp3"], var.root_volume_type)
    error_message = "Root volume type must be gp2 or gp3"
  }
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  # default     = 20
}

variable "delete_on_termination" {
  description = "Delete root volume on instance termination"
  type        = bool
  # default     = true
}


variable "cpu_credits" {
  description = "CPU credit specification for burstable instances"
  type        = string
  default     = "standard"

  validation {
    condition     = contains(["standard", "unlimited"], var.cpu_credits)
    error_message = "CPU credits must be standard or unlimited"
  }
}


variable "enable_eip" {
  description = "Whether to attach an Elastic IP"
  type        = bool
  default     = true
}


## The following are for AMI Configuration
variable "ami_most_recent" {
  description = "Whether to fetch the most recent AMI"
  type        = bool
  default     = true
}

variable "ami_owners" {
  description = "List of AMI owner account IDs"
  type        = list(string)
}

variable "ami_name_pattern" {
  description = "AMI name filter pattern"
  type        = string
}

variable "ami_virtualization_type" {
  description = "Virtualization type of the AMI"
  type        = string
  default     = "hvm"
}

variable "ami_architecture" {
  description = "AMI architecture (x86_64 or arm64)"
  type        = string
  default     = "x86_64"
}
