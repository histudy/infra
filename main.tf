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

#コピー元アーカイブの定義
data "sakuracloud_archive" "debian" {
  os_type = "debian10"
}
