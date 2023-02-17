resource "null_resource" "name" {
    depends_on = [ module.ec2_instance_bastionHost ]
    connection {
        type     = "ssh"
        user     = "ec2-user"
        host     = aws_eip.vpc_elastic.public_ip
        private_key = file("private-key/terraform-key.pem")
    }
    # Copies the myapp.conf file to /etc/myapp.conf
    provisioner "file" {
        source      = "private-key/terraform-key.pem"
        destination = "/tmp/terraform-key.pem"
    }
    provisioner "remote-exec" {
        inline = [ "sudo chmod 400 /tmp/terraform-key.pem" ]
    }
    // provisioner "local-exec" {
    //     command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    //     working_dir = "local-exec-output-files/"
    //     #on_failure = continue
    // }
}