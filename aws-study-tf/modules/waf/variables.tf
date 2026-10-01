
variable "alb_arn" {
  type        = string
  description = "WAFを関連付けるALBのARN"
}

variable "rate_limit" {
  type        = number
  description = "5分間に同一IPから許容するリクエスト数の上限"
  default     = 2000
}

variable "environment" {
  type = string
}
