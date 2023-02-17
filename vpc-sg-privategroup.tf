module "sg_privategroup" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.17.1"
    //   
    name        = "private-sg"
    description = "Security group with HTTP & SSH ports open for everybody (IPv4 CIDR), egress ports are all world open"
    vpc_id      =  module.vpc.vpc_id
    // ingress 
    ingress_cidr_blocks      = [module.vpc.vpc_cidr_block]
    ingress_rules            = ["ssh-tcp", "http-80-tcp"]
    // egress
    egress_rules = ["all-all"]
}