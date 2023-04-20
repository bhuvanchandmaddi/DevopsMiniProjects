variable "aws_region" {
  description = "The AWS region in which to create resources."
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC."
  type        = string
}

variable "IGW_name" {
  description = "The name of the internet gateway."
  type        = string
}

variable "Main_Routing_Table" {
  description = "The name of the main route table."
  type        = string
}

variable "Private_Routing_Table" {
  description = "The name of the private route table."
  type        = string
}

variable "environment" {
  description = "The name of the environment (e.g. dev, prod)."
  type        = string
}

variable "azs" {
  description = "The availability zones to use for subnets."
  type        = list(string)
}

variable "public_cidrs" {
  description = "The CIDR blocks for the public subnets."
  type        = list(string)
}

variable "private_cidrs" {
  description = "The CIDR blocks for the private subnets."
  type        = list(string)
}
