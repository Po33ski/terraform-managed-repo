resource "aws_ecr_repository" "example" {
  name                 = "terraform_lab"  # 'name' is correct for ECR
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "my-bucket"
  }
}