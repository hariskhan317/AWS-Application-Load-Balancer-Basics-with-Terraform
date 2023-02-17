module "ec2_instance_private" {
    depends_on = [module.vpc]
    source  = "terraform-aws-modules/ec2-instance/aws"
    version = "~> 3.0"
    for_each = toset(["0", "1"])
    name = "ec2_instance_private"

    ami                    = data.aws_ami.amzlinux2.id
    instance_type          = var.instance_type
    key_name               = var.key_name
    vpc_security_group_ids = [module.sg_privategroup.security_group_id]
    subnet_id =  element(module.vpc.private_subnets, tonumber(each.key)) 
    user_data = file("${path.module}/app1-install.sh")
    tags ={
    name = "ec2_instance_private"
    }
}