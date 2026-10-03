#セキュリティグループ
resource "aws_security_group" "ec2" {
  name_prefix = "${var.environment}-ec2-sg-"
  vpc_id      = var.vpc_id

  # 入ってくる通信(インバウンド)のルール
  ingress {
    description = "SSH from my IP only"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }


  # 出ていく通信(アウトバウンド)は全部許可
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.environment}-ec2-sg"
  }
}



#AMIを自動取得
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}


#EC2
resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2.id]

  tags = {
    Name = "${var.environment}-ec2"
  }
}


