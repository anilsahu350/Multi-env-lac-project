# dev-infrastructure
module "dev-infra" {
  source = "./infra"
  env = "dev"
  instance_count = 2
  instance_type = "t2.micro"
  ami_id="ami-020cba7c55df1f615"
  instance_volume_size = 8
}

# stg-infrastructure
module "stg-infra" {
  source = "./infra"
  env = "stg"
  instance_count = 2
  instance_type = "t2.micro"
  ami_id="ami-020cba7c55df1f615"
  instance_volume_size = 8
}

# prod-infrastructure
module "prod-infra" {
  source = "./infra"
  env = "prod"
  instance_count = 3
  instance_type = "t2.micro"
  ami_id="ami-020cba7c55df1f615"
  instance_volume_size = 8
}


