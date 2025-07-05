output "dev_public_ips" {
  value = module.dev-infra.instance_public_ips
}

output "stg_public_ips" {
  value = module.stg-infra.instance_public_ips
}

output "prod_public_ips" {
  value = module.prod-infra.instance_public_ips
}
