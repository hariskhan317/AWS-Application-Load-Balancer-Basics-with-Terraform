output "vpc-id" {
    value       = "module.vpc.vpc.id" 
    description = "vpc-id" 
}

output "vpc-cidr" {
    value = "module.vpc.vpc_cidr_block"
    description = "vpc cidr block"
}

output "availability-zone" {
    value = "module.vpc.azs"
    description = "availability-zone"
}

output "private-subnets"{
    value = "module.vpc.private_subnets"
    description = "private_subnets"
}

output "public-subnets"{
    value = "module.vpc.public_subnets"
    description = "public_subnets"
}

output "database-subnets"{
    value = "module.vpc.database_subnets"
    description = "database_subnets"
}