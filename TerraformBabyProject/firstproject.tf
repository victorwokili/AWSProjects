provider "aws" {
    region     = "us-east-1"
  access_key = ""
  secret_key = "/3RYk9e4ykc9"
}

#create a new VPC
resource "aws_vpc" "wok-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "wok-vpc"
    }
}

#Create internet Gateway
resource "aws_internet_gateway" "wok-internet-gateway" {
    vpc_id = aws_vpc.wok-vpc.id

    tags = {
        Name = "wok-internet-gateway"
    }
}

#Create Route Table
resource "aws_route_table" "wok-route-table"{
    vpc_id = aws_vpc.wok-vpc.id 

    # route = {
    #     cidr_block = "0.0.0.0/0"
    #     gateway_id = aws_internet_gateway.wok-internet-gateway.id
    # }

    tags = {
        Name: "wok-route-table"
    }
}

resource "aws_route" "r" {
  route_table_id            = aws_route_table.wok-route-table.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id                = aws_internet_gateway.wok-internet-gateway.id
  depends_on                = [aws_route_table.wok-route-table]
}


#Create a Subnet
resource "aws_subnet" "wok-public-subnet"{
    vpc_id = aws_vpc.wok-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name: "wok=public-subnet"
    } 
}

#Associate Route Table with Subnet
resource "aws_route_table_association" "wok-rta" {
  subnet_id = aws_subnet.wok-public-subnet.id
  route_table_id = aws_route_table.wok-route-table.id
}

#Create Security Group to allow port 22, 80, 443
resource "aws_security_group" "publicSG" {
  name        = "publicSG"
  description = "Allow web traffic on port 22, 80, 443"
  vpc_id      = aws_vpc.wok-vpc.id

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  tags = {
    Name = "publicSG"
  }
}


#Create a Network Interface
resource "aws_network_interface" "wok-NIC" {
  subnet_id       = aws_subnet.wok-public-subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.publicSG.id]
  }


#Create an Elastic IP Address

resource "aws_eip" "one" {
  vpc                       = true
  network_interface         = aws_network_interface.wok-NIC.id
  associate_with_private_ip = "10.0.1.50"
  depends_on = [
    aws_internet_gateway.wok-internet-gateway
  ]

}

#Create an ubuntu server and install apache
resource "aws_instance" "web-server" {
  ami                     = "ami-069aabeee6f53e7bf"
  availability_zone       = "us-east-1a"
  instance_type           = "t2.micro"
  key_name = "virginia"
  network_interface {
    device_index = 0
    network_interface_id = aws_network_interface.wok-NIC.id 
  }

  user_data = <<-EOF
                    #!/bin/bash 
                    # Use this for your user data (script from top to bottom)
                    # install httpd (Linux 2 version)
                    yum update -y 
                    yum install -y httpd 
                    systemctl start httpd 
                    systemctl enable httpd 
                    echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
                    EOF
     
tags = {
  Name = "web-server"
}
  #host_resource_group_arn = "arn:aws:resource-groups:us-west-2:012345678901:group/win-testhost"
  #tenancy                 = "host"
}