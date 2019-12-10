terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "histudy"
    workspaces {
      name = "sakura"
    }
  }
}

provider "sakuracloud" {
  zone = "is1b"
}

output "ip_address" {
  value = sakuracloud_server.web.ipaddress
}
