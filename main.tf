# terraform {
#   backend "remote" {
#     hostname     = "app.terraform.io"
#     organization = "histudy"
#     workspaces {
#       name = "sakura"
#     }
#   }
# }

provider "sakuracloud" {
  zone = "tk1v"
}
