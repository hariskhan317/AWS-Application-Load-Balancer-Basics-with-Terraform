resource "aws_eip" "vpc_elastic" {
    depends_on = [ module.vpc, module.ec2_instance_bastionHost]
    instance = module.ec2_instance_bastionHost.id
    vpc      = true
}
