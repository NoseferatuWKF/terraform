resource "proxmox_vm_qemu" "vms" {
    for_each    = var.vms
    target_node = "proxmox"
    vmid        = each.value.vmid
    name        = each.value.name
    iso         = each.value.iso
    bios        = each.value.bios
    boot        = each.value.boot
    qemu_os     = each.value.qemu_os
    oncreate    = each.value.oncreate
    sockets     = each.value.sockets
    cores       = each.value.cores
    cpu         = each.value.cpu
    memory      = each.value.memory
    scsihw      = each.value.scsihw

    disk {
        storage     = each.value.storage
        size        = each.value.size
        type        = each.value.type
        backup      = false
        iothread    = 1
    }

    dynamic "network" {
        for_each    = each.value.network
        content {
            model       = network.value.model
            bridge      = network.value.bridge
        }
    }

    # only root can set
    # https://github.com/Telmate/terraform-provider-proxmox/pull/618/files#diff-104365919f693375882979581d9f36f5266991eef361948e56c220931fe886dd
    # hostpci {
    #     host = "0000:2d:00.0"
    # }
}

