provider "aws" {
   region = "us-east-1"
   access_key = "AKIAVMSCAAKWTWJKCVJY"
   secret_key = "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"
}
variable "subnet_cidr_block" {
     description = "subnet cidr block"
}


resource "aws_vpc" "development-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
       name: "development"
       }
}


resource "aws_subnet" "dev-subnet" {
       vpc_id = aws_vpc.development-vpc.id
       cidr_block = var.subnet_cidr_block
       availability_zone = "us-east-1c"
       tags = {
         name: "subnet-1-dev"
           }
}