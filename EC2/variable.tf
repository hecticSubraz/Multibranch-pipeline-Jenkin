variable "region" {
  description = "The AWS region to deploy the instance"
  type        = string
  default     = "us-east-1" # You can change this to your preferred region
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-004dac467bb041dc7" # Ubuntu 22.04 LTS for us-east-1
}

variable "instance_type" {
  description = "The instance type for the EC2"
  type        = string
  default     = "t2.micro"
}
