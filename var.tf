variable "aws_region" {
  default = "ap-south-1"
}

variable "availabilityZone-a" {
  default = "ap-south-1a"
}
variable "availabilityZone-b" {
  default = "ap-south-1b"
}

variable "vpcCIDRblock" {
  default = "10.0.0.0/16"
}
variable "instanceTenancy" {
  default = "default"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "subnet_1_CIDRblock" {
  default = "10.0.0.0/24"
}
variable "subnet_2_CIDRblock" {
  default = "10.0.16.0/24"
}
variable "subnet_3_CIDRblock" {
  default = "10.0.32.0/24"
}
variable "subnet_4_CIDRblock" {
  default = "10.0.64.0/24"
}
variable "mapPublicIP" {
    default = true    
}
variable "noPublicIP" {
    default = false    
}

