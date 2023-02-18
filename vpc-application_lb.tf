module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"
    # insert the 5 required variables here
      name = "my-alb"
    load_balancer_type = "application" 
    vpc_id = module.vpc.vpc_id
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
    // target group
    target_groups = [{
        name_prefix      = "pref-"
        backend_protocol = "HTTP"
        backend_port     = 80
        target_type      = "instance"
        health_check = {
            enabled             = true
            interval            = 30
            path                = "/app1/index.html"
            port                = "traffic-port"
            healthy_threshold   = 3
            unhealthy_threshold = 3
            timeout             = 6
            protocol            = "HTTP"
            matcher             = "200-399"
        }
        targets = {
            my_app1_vm1  = {
                target_id = element([for instance in module.ec2_instance_private: instance.id],0)
                port = 80 }
            my_app1_vm2 = {
                target_id = element([for instance in module.ec2_instance_private: instance.id],1)
                port = 80 }
        }
    }]
}