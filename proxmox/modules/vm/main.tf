resource "proxmox_vm_qemu" "vms" {
    for_each    = var.vms
    vmid        = each.value.vmid
    name        = each.value.name
    target_node = each.value.target_node
    iso         = each.value.iso
    bios        = each.value.bios
    boot        = each.value.boot
    qemu_os     = each.value.qemu_os
    oncreate    = each.value.oncreate
    agent       = each.value.agent
    sockets     = each.value.sockets
    cores       = each.value.cores
    cpu         = each.value.cpu
    memory      = each.value.memory
    scsihw      = each.value.scsihw
    machine     = each.value.machine

    disk {
        storage     = each.value.storage
        size        = each.value.size
        type        = each.value.type
        backup      = false
    }

    network {
        model       = each.value.model
        bridge      = each.value.bridge
    }

    # only root can set
    # https://github.com/Telmate/terraform-provider-proxmox/pull/618/files#diff-104365919f693375882979581d9f36f5266991eef361948e56c220931fe886dd
    # hostpci {
    #     host = "0000:2d:00.0"
    # }
}
