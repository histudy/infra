data "http" "wate" {
  url = "https://github.com/wate.keys"
}
data "http" "t223n" {
  url = "https://github.com/223n.keys"
}
data "http" "sperkbird" {
  url = "https://github.com/sperkbird.keys"
}

resource "sakuracloud_ssh_key" "wate" {
  name       = "wate"
  public_key = data.http.wate.body
}

resource "sakuracloud_ssh_key" "t223n" {
  name       = "223n"
  public_key = data.http.t223n.body
}
resource "sakuracloud_ssh_key" "sperkbird" {
  name       = "sperkbird"
  public_key = data.http.sperkbird.body
}
