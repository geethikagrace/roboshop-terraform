output "vpc" {
  value = lookup(lookup(module.vpc, "main"), "subnets")
}