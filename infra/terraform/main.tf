terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pm_api_url
  pm_api_token_id     = var.pm_api_token_id
  pm_api_token_secret = var.pm_api_token_secret
  pm_tls_insecure     = true

}


resource "proxmox_vm_qemu" "vm1" {
  vmid        = 100
  name        = "vm1-k3s"
  target_node = "hendiirwanto"
  clone       = "ubuntu-noble-template"

  agent = 1

  cpu {
    cores = 2
  }
  memory             = 8192
  vm_state           = "running"
  automatic_reboot   = true
  start_at_node_boot = true

  boot   = "order=scsi0"
  scsihw = "virtio-scsi-single"

  ciuser     = var.ci_user
  cipassword = var.ci_password
  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=192.168.8.110/24,gw=192.168.8.1"
  skip_ipv6  = true

  sshkeys = file(var.ci_ssh_public_key)

  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "74G"
          storage = "local-lvm"
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }



  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      startup_shutdown,
    ]
  }
}

resource "proxmox_vm_qemu" "vm2" {
  vmid        = 101
  name        = "vm2-storage"
  target_node = "hendiirwanto"
  clone       = "ubuntu-noble-template"

  agent = 1

  cpu {
    cores = 1
  }
  memory             = 4096
  vm_state           = "running"
  automatic_reboot   = true
  start_at_node_boot = true

  boot   = "order=scsi0"
  scsihw = "virtio-scsi-single"

  ciuser     = var.ci_user
  cipassword = var.ci_password
  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=192.168.8.120/24,gw=192.168.8.1"
  skip_ipv6  = true

  sshkeys = file(var.ci_ssh_public_key)

  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "120G"
          storage = "local-lvm"
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      startup_shutdown,
    ]
  }
}

resource "proxmox_vm_qemu" "vm3" {
  vmid        = 102
  name        = "vm3-devops"
  target_node = "hendiirwanto"
  clone       = "ubuntu-noble-template"

  agent = 1

  cpu {
    cores = 1
  }
  memory             = 4096
  vm_state           = "running"
  automatic_reboot   = true
  start_at_node_boot = true

  boot   = "order=scsi0"
  scsihw = "virtio-scsi-single"

  ciuser     = var.ci_user
  cipassword = var.ci_password
  ciupgrade  = true
  nameserver = "1.1.1.1 8.8.8.8"
  ipconfig0  = "ip=192.168.8.130/24,gw=192.168.8.1"
  skip_ipv6  = true

  sshkeys = file(var.ci_ssh_public_key)

  serial {
    id = 0
  }

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "36G"
          storage = "local-lvm"
        }
      }
    }
    ide {
      ide1 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    id     = 0
    model  = "virtio"
    bridge = "vmbr0"
  }

  lifecycle {
    ignore_changes = [
      startup_shutdown,
    ]
  }
}
