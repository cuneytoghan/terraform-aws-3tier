output "web1_public_ip" {
  value       = aws_instance.web1.public_ip
  description = "public IP of web1"

}
output "web2_public_ip" {
  value       = aws_instance.web2.public_ip
  description = "public IP of web2"

}
output "web3_public_ip" {
  value       = aws_instance.web3.public_ip
  description = "public IP of web3"

}
output "alb_dns_name" {
  value       = aws_lb.taskalb.dns_name
  description = "DNS name of alb"

}