// vpc output for security group

// bastionsHost sg

// security_group_id
output "output_bastionsHost_sg_id" {
    value = "module.sg_bastionhost.security_group_id"
}
// security_group_name
output "output_bastionsHost_sg_name" {
    value = "module.sg_bastionhost.security_group_name"
}
// security_group_vpc_id
output "output_bastionsHost_sg_vpc_id" {
    value = "module.sg_bastionhost.security_group_vpc_id"
}

// private  sg

// security_group_id
output "output_private_sg_id" {
    value = "module.sg_privategroup.security_group_id"
}
// security_group_name
output "output_private_sg_name" {
    value = "module.sg_privategroup.security_group_name"
}
// security_group_vpc_id
output "output_private_sg_vpc_id" {
    value = "module.sg_privategroup.security_group_vpc_id"
}
