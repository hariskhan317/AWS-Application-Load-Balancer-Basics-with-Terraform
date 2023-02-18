module "sg_elb" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.17.1"
    //   
    name        = "sg_elb"
    description = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
    vpc_id      =  module.vpc.vpc_id
    // ingress 
    ingress_cidr_blocks      = ["0.0.0.0/0"]
    ingress_rules            = ["http-80-tcp"]
    // egress
    egress_rules = ["all-all"]


      ingress_with_cidr_blocks = [
    {
      from_port   = 81
      to_port     = 81
      protocol    = 6
      description = "Allow Port 81 from internet"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}
