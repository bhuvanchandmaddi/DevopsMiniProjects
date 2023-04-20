aws_region            = "ap-southeast-2"
vpc_cidr              = "172.16.0.0/16"
vpc_name              = "terraform-demo-vpc"
IGW_name              = "terraform-demo-igw"
Main_Routing_Table    = "terraform-demo-vpc-public-rt"
Private_Routing_Table = "terraform-demo-vpc-private-rt"
environment           = "dev"
azs                   = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
public_cidrs          = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24"]
private_cidrs         = ["172.16.4.0/24", "172.16.5.0/24", "172.16.6.0/24"]
image_amis = {
  ap-southeast-2 = "ami-05f998315cca9bfe3"
  ap-southeast-1 = "ami-0a72af05d27b49ccb"
}
instance_type = "t2.micro"
key_name      = "sample_key"

