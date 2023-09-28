resource "proxmox_lxc" "containers" {
    for_each        = var.lxc
    vmid            = each.value.vmid
    hostname        = each.value.hostname
    target_node     = "proxmox"
    ostemplate      = each.value.ostemplate
    unprivileged    = true

    ssh_public_keys = var.lxc_public_key

    // Terraform will crash without rootfs defined
    rootfs {
        storage = "local-btrfs"
        size    = each.value.size
    }

    network {
        name   = "eth0"
        bridge = each.value.bridge
        ip     = "dhcp"
    }
}
