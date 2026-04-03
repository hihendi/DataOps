output "vm_names" {
  value = [
    proxmox_vm_qemu.vm1.name,
    proxmox_vm_qemu.vm2.name,
    proxmox_vm_qemu.vm3.name
  ]
}
