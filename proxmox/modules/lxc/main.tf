resource "proxmox_lxc" "containers" {
    for_each        = var.lxc
    vmid            = each.value.vmid
    hostname        = each.value.hostname
    target_node     = "proxmox"
    ostemplate      = each.value.ostemplate
    unprivileged    = true

    ssh_public_keys = <<-EOT
        ssh-rsa ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnScHCvYlXhlJ6HIEF4eVwmkYFx+uye1zshLe8wFxNkUmggy1+OevhL8px89aakKESWd4gZS8n+ftUWBwUEmGfGm5DwZXxEklO5n+kCgGykKCp9JHE7meAhTh/4PV3S4b/XkQq0K2pVzs5VKvkl+cAC8kWopbBUtTJTuoZDbaRlVqP2hnCXakCWlfePEtQccy6HKW0EZlSBk7UHrQCrUlLL/OXUNVyzC6Kfdd0GOc7CtEe4lz+76d6H2S5SzL0QN9zksuKJhzh7pCy39UMs7GxizK8mTw93/mmV/f+0ncTxa29gUBvKZT2pWftMKvRSzxEnK3c7gCpp5DDQJF+DZd3ZaW6S5UsQhPxjVZL0H99atyxP6TTew44DmIgmDdSG/LPhVaCQJQEmi87xR47O6gxWvICJRiTnRM+4tagsBrTRssKNss+rwdHchctnpu9rCCN6QodbJ+gYSABsjrJtmOox1YYF2hpRDv4jtj2MBYU+7Cg0e/7DCPE3HQSoZj+JGM=
    EOT

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
