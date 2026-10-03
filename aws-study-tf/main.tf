module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"
  public_subnet_cidrs = {
    "ap-northeast-1a" = "10.0.1.0/24"
    "ap-northeast-1c" = "10.0.2.0/24"
  }
  private_subnet_cidrs = {
    "ap-northeast-1a" = "10.0.11.0/24"
    "ap-northeast-1c" = "10.0.12.0/24"
  }
    environment = "dev"
}

module "alb" {
  source = "./modules/alb"

  vpc_id              = module.vpc.vpc_id
  public_subnet_ids   = module.vpc.public_subnet_ids
  target_instance_id  = module.ec2.instance_id  
  environment         = "dev"
}


module "ec2" {
  source = "./modules/ec2"

  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public_subnet_ids[0]
  my_ip         = "125.195.21.193/32"
  environment   = "dev"

}


# EC2のSGに「ALBからの通信を許可する」ルールを後から追加
resource "aws_security_group_rule" "ec2_from_alb" {
  type                     = "ingress"
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = module.ec2.security_group_id       # EC2側のSG
  source_security_group_id = module.alb.alb_security_group_id   # ALB側のSG
}



module "rds" {
  source = "./modules/rds"

  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  ec2_security_group_id   = module.ec2.security_group_id
  db_username              = "admin"
  db_password              = var.db_password
  environment              = "dev"
}



module "cloudwatch" {
  source = "./modules/cloudwatch"

  ec2_instance_id    = module.ec2.instance_id
  rds_instance_id    = module.rds.db_identifier
  alb_arn_suffix     = module.alb.alb_arn_suffix
  notification_email = "ja.matane.iwtr@gmail.com"
  environment        = "dev"
}


module "waf" {
  source = "./modules/waf"

  alb_arn     = module.alb.alb_arn
  environment = "dev"
}
