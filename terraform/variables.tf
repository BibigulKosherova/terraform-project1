variable "region" {
  description = "Provide region"
  type    = string
  default = "us-east-2"
}

variable "vpc_config" {
  description = "VPC configuration"
  type = object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  })
  default = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
  }
}

variable "subnet_cidr_blocks" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["a", "b", "c"]
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IP on launch for subnets"
  type        = bool
  default     = true
}

variable "default_route_cidr" {
  description = "CIDR block for default route"
  default     = "0.0.0.0/0"

}

variable "allowed_ports" {
  type    = list(number)
  default = [22, 8080]
}

variable "allowed_cidr" {
  description = "CIDR block for inbound traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

