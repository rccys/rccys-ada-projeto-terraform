resource "aws_ecs_cluster" "ada_ecs_cluster" {
  name = "${var.project_name}-${terraform.workspace}-ecs-cluster"

  tags = {
    Environment = "${var.project_name}-${terraform.workspace}"
  }
}

resource "aws_lb" "ada_ecs_lb" {
  name               = "${var.project_name}-${terraform.workspace}-lb"
  internal           = false
  load_balancer_type = "application"
  #security_groups    = [aws_security_group.ada_ecs_sg.id]
  subnets            = [for subnet in aws_subnet.ada_ecs_subnet : subnet.id]

  tags = {
    Name = "${var.project_name}-${terraform.workspace}-lb"
  }
}

resource "aws_lb_target_group" "ada_ecs_tg" {
  name     = "${var.project_name}-${terraform.workspace}-tg"
  port     = 80
  protocol = "HTTP"
  target_type = "ip"
  vpc_id   = aws_vpc.ada_ecs_vpc.id
  health_check {
    path = "/"
    interval = 30
    timeout = 5
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "ada_ecs_listener_front_end" {
  load_balancer_arn = aws_lb.ada_ecs_lb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.ada_ecs_tg.arn
  }
}

#resource "aws_ecs_task_definition" "ada_ecs_task" {
#  family = 
#  execution_role_arn = 
#
#  }