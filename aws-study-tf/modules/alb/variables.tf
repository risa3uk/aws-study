
variable "vpc_id" {
  type        = string
  description = "ALBを配置するVPCのID"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "ALBを配置するpublicサブネットのIDリスト"
}

variable "target_instance_id" {
  type        = string
  description = "振り分け先にするEC2インスタンスのID"
}

variable "environment" {
  type = string
}
