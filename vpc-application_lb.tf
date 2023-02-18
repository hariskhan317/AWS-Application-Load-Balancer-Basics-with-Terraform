module "application-load-balancer" {
    source  = "infrablocks/application-load-balancer/aws"
    version = "4.1.0-rc.2"
    # insert the 5 required variables here
    name = "Application_loadBalance"
    load_balancer_type = "application" 
    vpc_id = module.vpc.vpc.id
    subnets = [
        module.vpc.public_subnets[0],
        module.vpc.public_subnets[1]
    ]
    security_groups = [module.sg_elb.security_group_id]
    http_tcp_listeners = [
        {
            port               = 80
            protocol           = "HTTP"
            target_group_index = 0
        }
    ]
}