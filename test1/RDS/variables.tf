variable "password" {
  type        = string
  sensitive   = true
  description = "DB password"
}
variable "username" {
  type        = string
  sensitive   = true
  description = "DB username"
}
variable "common_tags" {
  type = map(any)
  default = {
    Team = "DevOps"
    Tool = "Terraform"
  }
  description = "resource tags"
}
