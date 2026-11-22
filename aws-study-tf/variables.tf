
variable "db_password" {
  type        = string
  description = "RDSの管理者パスワード"
  sensitive   = true
}
