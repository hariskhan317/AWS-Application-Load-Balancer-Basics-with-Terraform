// OUTPUT FOR PUBLIC AND PRIVATE INSTANCE

// id_bastionhost_instance OUTPUT
output "id_bastionhost_instance" {
  value       = module.ec2_instance_bastionHost.id
  description = "Public id for bastion host " 
}
// ip_bastionhost OUTPUT
output "ip_bastionhost" {
  value       = module.ec2_instance_bastionHost.public_ip 
  description = "Public ip for bastionhost " 
}


//id_private_instance OUTPUT
output "id_private_instance" {
  value       = [for ec2private in module.ec2_instance_private: ec2private.id ]
  description = "id for Private Instance " 
}
//ip_private_instance OUTPUT
output "ip_private_instance" {
  value       = [for ec2private in module.ec2_instance_private: ec2private.private_ip ]
  description = "ip for Private Instance " 
}
