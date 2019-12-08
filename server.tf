data "sakuracloud_archive" "buster" {
  os_type = "debian10"
}

resource "sakuracloud_disk" "web" {
  name              = "web"
  size              = 20
  source_archive_id = data.sakuracloud_archive.buster.id
}

resource "sakuracloud_server" "web" {
  name = "web"
  disks = [
    sakuracloud_disk.web.id
  ]
  #コア数
  core = 1
  #メモリサイズ(GB)
  memory = 1

  #パケットフィルタ
  packet_filter_ids = [
    sakuracloud_packet_filter.default.id,
  ]

  hostname = "histudy.jp"
  password = "p@55w0rd"
  # SSH接続でのパスワード/チャレンジレスポンス認証無効化
  disable_pw_auth = true

  #SSH公開鍵
  ssh_key_ids = [
    sakuracloud_ssh_key.wate.id,
    sakuracloud_ssh_key.t223n.id,
    sakuracloud_ssh_key.sperkbird.id
  ]
}
