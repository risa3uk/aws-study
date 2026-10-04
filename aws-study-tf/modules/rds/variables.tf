variable "vpc_id" {
  type        = string
  description = "RDSを配置するVPCのID"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "RDSを配置するprivateサブネットのIDリスト"
}

variable "ec2_security_group_id" {
  type        = string
  description = "RDSへのアクセスを許可するEC2のセキュリティグループID"
}

variable "db_username" {
  type        = string
  description = "DBの管理者ユーザー名"
}

variable "db_password" {
  type        = string
  description = "DBの管理者パスワード"
  sensitive   = true
}

variable "environment" {
  type = string
}
