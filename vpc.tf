provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "ilead-vpc" {
  cidr_block            = var.vpcCIDRblock
  instance_tenancy      = var.instanceTenancy
  enable_dns_support    = var.dnsSupport
  enable_dns_hostnames  = var.dnsHostNames
  tags = {
      Name = "ilead-vpc"
  }
}

resource "aws_subnet" "Public_Subnet_1" {
  vpc_id                  = aws_vpc.ilead-vpc.id
  cidr_block              = var.subnet_1_CIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone-a
tags = {
   Name = "Public_Subnet_1"
}
}

resource "aws_subnet" "Public_Subnet_2" {
  vpc_id                  = aws_vpc.ilead-vpc.id
  cidr_block              = var.subnet_2_CIDRblock
  map_public_ip_on_launch = var.mapPublicIP 
  availability_zone       = var.availabilityZone-b
tags = {
   Name = "Public_Subnet_2"
}
}
resource "aws_subnet" "Private_Subnet_1" {
  vpc_id                  = aws_vpc.ilead-vpc.id
  cidr_block              = var.subnet_3_CIDRblock
  map_public_ip_on_launch = var.noPublicIP 
  availability_zone       = var.availabilityZone-a
tags = {
   Name = "Private_Subnet_1"
}
}
resource "aws_subnet" "Private_Subnet_2" {
  vpc_id                  = aws_vpc.ilead-vpc.id
  cidr_block              = var.subnet_4_CIDRblock
  map_public_ip_on_launch = var.noPublicIP 
  availability_zone       = var.availabilityZone-b
tags = {
   Name = "Private_Subnet_2"
}
}

