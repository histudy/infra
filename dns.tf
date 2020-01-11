resource "sakuracloud_dns" "default" {
  zone = "histudy.jp"
  records {
    name  = "@"
    type  = "A"
    value = sakuracloud_server.web.ipaddress
  }
  records {
    name  = "www"
    type  = "A"
    value = sakuracloud_server.web.ipaddress
  }
  records {
    name     = "@"
    type     = "MX"
    priority = 10
    value    = "histudy.sakura.ne.jp."
  }
  records {
    name  = "mail"
    type  = "NS"
    value = "ns1.dns.ne.jp."
  }
  records {
    name  = "mail"
    type  = "NS"
    value = "ns2.dns.ne.jp."
  }
}
