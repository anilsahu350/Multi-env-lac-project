resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "${var.env}-anil-devops-bucket"

  tags = {
    Name = "${var.env}-anil-devops-bucket"
    Environment = var.env
  }
}