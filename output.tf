output "public_ip_web" {
 value = ["${aws_instance.web.*.public_ip}"] 
}

output "public_ip_db" {
 value = ["${aws_instance.db.*.public_ip}"]
}
   
