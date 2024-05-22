resource "aws_vpc" "ada_ecs_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project_name}-${terraform.workspace}-vpc"
  }
}

resource "aws_subnet" "ada_ecs_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.ada_ecs_vpc.id
  cidr_block              = count.index == 0 ? "10.0.1.0/24" : "10.0.2.0/24"
  availability_zone       = count.index == 0 ? "us-east-1a" : "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-${terraform.workspace}-subnet-${count.index}"
  }
}

resource "aws_internet_gateway" "ada_ecs_igw" {
  vpc_id = aws_vpc.ada_ecs_vpc.id
  tags = {
    Name = "${var.project_name}-${terraform.workspace}-igw"
  }
}

resource "aws_route_table" "ada_ecs_rt" {
  vpc_id = aws_vpc.ada_ecs_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ada_ecs_igw.id
  }
  tags = {
    Name = "${var.project_name}-${terraform.workspace}-rt"
  }
}

resource "aws_route_table_association" "ada_ecs_rt_association" {
 count = length(aws_subnet.ada_ecs_subnet)
 subnet_id = aws_subnet.ada_ecs_subnet[count.index].id
 route_table_id = aws_route_table.ada_ecs_rt.id
}