module "sg_bastionhost" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.17.1"
    //   
    name        = "bastionhost_public"
    description = "Security group with SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
    vpc_id      =  module.vpc.vpc_id
    // ingress 
    ingress_cidr_blocks      = ["0.0.0.0/0"]
    ingress_rules            = ["ssh-tcp"]
    // egress
    egress_rules = ["all-all"]
}