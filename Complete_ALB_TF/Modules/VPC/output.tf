output "region" {
  value = var.region
}
output "project_name" {
  value = var.project_name
}
output "vpc_id" {
  value = aws_vpc.myvpc.id
}
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}
output "public_subnet_az2_id" {
  value =  aws_subnet.public_subnet_az2.id
}
output "app_private_subnet_az1_id" {
 value = aws_subnet.private_app_subnet_az1.id  
}
output "app_private_subnet_az2_id" {
 value = aws_subnet.private_app_subnet_az2.id
}
output "data_private_subnet_az1_id" {
  value = aws_subnet.private_data_subnet_az1.id
}
output "data_private_subnet_az2_id" {
  value = aws_subnet.private_data_subnet_az2.id
}
output "internet_gateway" {
  value = aws_internet_gateway.internet_gateway
}