variable "vpc_id" {
  type        = string
  description = "EC2を配置するVPCのID"
}

variable "subnet_id" {
  type        = string
  description = "EC2を配置するサブネットのID"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "my_ip" {
  type        = string
  description = "SSH接続を許可する自分のグローバルIP(CIDR形式)"
}

variable "environment" {
  type = string
}
