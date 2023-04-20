
module "test-vpc" {
  source                = "../modules/vpc"
  aws_region            = var.aws_region
  vpc_cidr              = var.vpc_cidr
  vpc_name              = var.vpc_name
  IGW_name              = var.IGW_name
  Main_Routing_Table    = var.Main_Routing_Table
  Private_Routing_Table = var.Private_Routing_Table
  environment           = var.environment
  azs                   = var.azs
  public_cidrs          = var.public_cidrs
  private_cidrs         = var.private_cidrs
}

module "ec2" {
  source         = "../modules/ec2"
  instance_type  = var.instance_type
  environment    = module.test-vpc.environment
  key_name       = var.key_name
  amis           = var.image_amis
  region         = module.test-vpc.region
  vpc_name       = module.test-vpc.vpc_id
  security_group = module.test-vpc.sg_id
  public-subnets = module.test-vpc.public_subnets
}

