variable "vpc_cidr" {
  type        = string
  description = "VPCのCIDRブロック"
}


#publicサブネット
variable "public_subnet_cidrs" {
  type        = map(string)
  description = "AZごとのpublicサブネットCIDR"
}

#privateサブネット
variable "private_subnet_cidrs" {
  type        = map(string)
  description = "AZごとのprivateサブネットCIDR"
}


variable "environment" {
  type = string
}
