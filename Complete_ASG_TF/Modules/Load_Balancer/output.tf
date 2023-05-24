output "alb_target_group_arn_i"{
  value = aws_lb_target_group.alb_target_group_i.arn
}

output "alb_target_group_arn_ii"{
  value = aws_lb_target_group.alb_target_group_ii.arn
}

output "application_load_balancer_dns_name"{
  value = aws_lb.application_load_balancer.dns_name
}
output "application_load_balancer_zone_id"{
  value = aws_lb.application_load_balancer.zone_id 
}