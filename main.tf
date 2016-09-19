#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-097d9235
#
# Your security group ID is:
#
#     sg-74a4d00e
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     velocity-e4da3b7fbbce2345d7772b0674a318d5
#

# VARS:
variable "aws_access_key" {
  type = "string"
}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-1"
}

# Provider:
provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

# Resources
resource "aws_instance" "web" {
	ami = "ami-db24d8b6"
	instance_type = "t2.micro"
	subnet_id = "subnet-097d9235"
	count = 1
	vpc_security_group_ids = ["sg-74a4d00e"]
	tags  {
		Identity = "velocity-e4da3b7fbbce2345d7772b0674a318d5"
		VelovityCon = "New York"
		Year = 2016
	}
}

module "example" {
  source = "./example-module"
  command = "echo OMG Velocity!"
  commandJim = "echo OMG JIM"
}


# we use * to be able to handle output of instances N > 1
# terraform output -json public_ip | jq -r '.value[0]'
output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}

output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}

asdasd
