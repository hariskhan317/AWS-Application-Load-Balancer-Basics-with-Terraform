module "vpc" {
    source = "terraform-aws-modules/vpc/aws"

    name = "${local.name}-${var.vpc_name}"
    cidr = var.vpc_cidr_block

    // Avalability zone
    azs = var.vpc_availability_zones

    // Private, Public, Database Subnets
    private_subnets   = var.vpc_private_subnets
    public_subnets    = var.vpc_public_subnets

    // Database Subnets
    create_database_subnet_group           = var.vpc_create_database_subnet_group
    create_database_subnet_route_table     = var.vpc_create_database_subnet_route_table
    database_subnets  = var.vpc_database_subnets

    // create_database_nat_gateway_route  = true
    // create_database_internet_gateway_route = true

    //  NAT Gateways - Outbound Communication
    enable_nat_gateway = var.vpc_enable_nat_gateway
    single_nat_gateway = var.vpc_single_nat_gateway

    // dns
    enable_dns_hostnames = true
    enable_dns_support   = true

    // tags
    // tags = local.common_tags
    // vpc_tags = local.common_tags

    public_subnet_tags = {
        Type = "public_subnet"
    }

    private_subnet_tags = {
        Type = "private_subets"
    }

    database_subnet_tags = {
        Type = "dataase_subets"
    }
}