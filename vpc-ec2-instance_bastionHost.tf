module "ec2_instance_bastionHost" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "ec2_instance_bastionHost"

  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [module.sg_bastionhost.security_group_id]
  subnet_id              = module.vpc.public_subnets[0]
  tags ={
    name = "ec2_instance_bastionHost"
  }
}