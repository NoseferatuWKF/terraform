# TODO: separate vm to smaller contexts around 3 vm per context, as the plugin cannot handle too many vms
locals {
    resource_map = {
        core = {
            # TODO: wireguard
            vpn = {
                vmid        = 100
                name        = "vpn"
                iso         = "local-btrfs:iso/pfSense-CE-2.6.0-RELEASE-amd64.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                sockets     = 1
                cores       = 1
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                storage     = "local-btrfs"
                size        = "8G"
                type        = "scsi"
                network     = [
                    {
                        model       = "virtio"
                        bridge      = "vmbr0"
                    },
                    {
                        model       = "virtio"
                        bridge      = "vmbr1"
                    }
                ]
            }
            # TODO: setup disk passthrough
            nas = {
                vmid        = 101
                name        = "NAS"
                iso         = "local-btrfs:iso/TrueNAS-13.0-U5.1.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 8192
                scsihw      = "virtio-scsi-single"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                network     = [
                    {
                        model       = "virtio"
                        bridge      = "vmbr1"
                    }
                ]
            }
        }
        pop = {
            general = {
                    vmid        = 103
                    name        = "pop-general"
                    iso         = "local-btrfs:iso/pop-os_22.04_amd64_intel_30.iso"
                    bios        = "seabios"
                    boot        = "order=scsi0;ide2;net0"
                    qemu_os     = "l26"
                    oncreate    = false
                    sockets     = 1
                    cores       = 2
                    cpu         = "host"
                    memory      = 4096
                    scsihw      = "virtio-scsi-single"
                    storage     = "local-btrfs"
                    size        = "50G"
                    type        = "scsi"
                    network     = [
                        {
                            model       = "virtio"
                            bridge      = "vmbr1"
                        }
                    ]
            }
        }
        nix = {
            kubernetes = {
                vmid        = 104
                name        = "nix-kubernetes"
                iso         = "local-btrfs:iso/nixos-gnome-23.05.1156.ad157fe26e7-x86_64-linux.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                network     = [
                    {
                        model       = "virtio"
                        bridge      = "vmbr0"
                    }
                ]
            }
            grafana = {
                vmid        = 106
                name        = "nix-grafana"
                iso         = "local-btrfs:iso/nixos-gnome-23.05.1156.ad157fe26e7-x86_64-linux.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                sockets     = 1
                cores       = 1
                cpu         = "host"
                memory      = 2048
                scsihw      = "virtio-scsi-single"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                network     = [
                    {
                        model       = "virtio"
                        bridge      = "vmbr0"
                    }
                ]
            }
        }
        kali = {
            hacking = {
                vmid        = 105
                name        = "kali-hacking"
                iso         = "local-btrfs:iso/kali-linux-2023.2a-installer-amd64.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                network     = [
                    {
                        model       = "virtio"
                        bridge      = "vmbr1"
                    }
                ]
            }
        }
        lxc = {
            # TODO: automate post-installation with ansible container
            ansible = {
                vmid                = 107
                hostname            = "ansible"
                ostemplate          = "local-btrfs:vztmpl/alpine-3.18-default_20230607_amd64.tar.xz"
                storage             = "local-btrfs"
                size                = "512M"
                bridge              = "vmbr0"
            }
            tensorflow = {
                vmid                = 108
                hostname            = "tensorflow"
                ostemplate          = "local-btrfs:vztmpl/alpine-3.18-default_20230607_amd64.tar.xz"
                storage             = "local-btrfs"
                size                = "512M"
                bridge              = "vmbr0"
            }
        }
    }

    # VMs
    core = lookup(local.resource_map, "core", {})
    pop = lookup(local.resource_map, "pop", {})
    nix = lookup(local.resource_map, "nix", {})
    kali = lookup(local.resource_map, "kali", {})

    # Containers
    lxc = lookup(local.resource_map, "lxc", {})
}
