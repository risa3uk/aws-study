
variable "ec2_instance_id" {
  type        = string
  description = "監視対象のEC2インスタンスID"
}

variable "rds_instance_id" {
  type        = string
  description = "監視対象のRDSインスタンスID(identifier)"
}

variable "alb_arn_suffix" {
  type        = string
  description = "監視対象ALBのARNサフィックス(CloudWatchメトリクス用)"
}

variable "notification_email" {
  type        = string
  description = "アラーム通知を受け取るメールアドレス"
}

variable "environment" {
  type = string
}
