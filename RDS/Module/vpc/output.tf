output "vpc_id" {
  value = aws_vpc.VPC_imroshan.id
}
output "PublicSub_imroshan_id" {
  value = aws_subnet.PublicSub_imroshan.id
}
output "PrivateSub_imroshan_i_id" {
  value = aws_subnet.PrivateSub_imroshan_i.id
}
output "PrivateSub_imroshan_ii_id" {
  value = aws_subnet.PrivateSub_imroshan_ii.id
}