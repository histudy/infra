variable "ssh_source_network" {
  default = null
}
variable "ssh_public_port" {
  default = 2345
}
variable "ntp_source_network" {
  default = null
}

resource "sakuracloud_packet_filter" "default" {
  name = "default"

  expressions {
    description = "HTTP"
    protocol    = "tcp"
    source_port = "80"
    dest_port   = "80"
    allow       = true
  }
  expressions {
    description = "HTTPS"
    protocol    = "tcp"
    source_port = "443"
    dest_port   = "443"
    allow       = true
  }

  # expressions {
  #   description = "SMTP"
  #   protocol    = "tcp"
  #   source_port = "25"
  #   dest_port   = "25"
  #   allow       = true
  # }
  # expressions {
  #   description = "SMTP Submission"
  #   protocol    = "tcp"
  #   source_port = "587"
  #   dest_port   = "587"
  #   allow       = true
  # }
  # expressions {
  #   description = "SMTPS"
  #   protocol    = "tcp"
  #   source_port = "465"
  #   dest_port   = "465"
  #   allow       = true
  # }
  # expressions {
  #   description = "POP3"
  #   protocol    = "tcp"
  #   source_port = "110"
  #   dest_port   = "110"
  #   allow       = true
  # }
  # expressions {
  #   description = "POP3S"
  #   protocol    = "tcp"
  #   source_port = "995"
  #   dest_port   = "995"
  #   allow       = true
  # }
  # expressions {
  #   description = "IMAP"
  #   protocol    = "tcp"
  #   source_port = "143"
  #   dest_port   = "143"
  #   allow       = true
  # }
  # expressions {
  #   description = "IMAPS"
  #   protocol    = "tcp"
  #   source_port = "993"
  #   dest_port   = "993"
  #   allow       = true
  # }

  expressions {
    description = "SSH"
    protocol    = "tcp"
    source_nw   = var.ssh_source_network
    source_port = var.ssh_public_port
    dest_port   = "22"
    allow       = true
  }
  expressions {
    description = "NTP"
    protocol    = "udp"
    source_nw   = var.ntp_source_network
    source_port = "123"
    allow       = true
  }
  expressions {
    description = "DHCP"
    protocol    = "udp"
    dest_port   = "68"
    allow       = true
  }
  expressions {
    description = "icmp"
    protocol    = "icmp"
    allow       = true
  }
  expressions {
    description = "fragment"
    protocol    = "fragment"
    allow       = true
  }
  expressions {
    description = "Deny all"
    protocol    = "ip"
    source_port = "0-65535"
    allow       = false
  }
}
