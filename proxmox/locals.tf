# TODO: clone from template
locals {
    resource_map = {
        vms = {
            # TODO: wireguard
            # TODO: add LAN bridge
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
            # TODO: setup dsk passthrough
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
            # windows = {
            #     vmid        = 102
            #     name        = "gaming"
            #     iso         = "local-btrfs:iso/Win11_22H2_English_x64v2.iso"
            #     bios        = "ovmf"
            #     boot        = "order=ide2;scsi0;net0"
            #     qemu_os     = "win11"
            #     oncreate    = false
            #     sockets     = 1
            #     cores       = 8
            #     cpu         = "host"
            #     memory      = 16384
            #     scsihw      = "lsi"
            #     storage     = "local-btrfs"
            #     size        = "100G"
            #     type        = "sata"
            #     model       = "virtio"
            #     bridge      = "vmbr1"
            # }
            # TODO: automate post-installtion with ansible container
            # TODO: spice for audio and display
            pop = {
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
            demo = {
                vmid        = 109
                name        = "pop-demo"
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
        lxc = {
            ansible = {
                vmid                = 107
                hostname            = "ansible"
                ostemplate          = "local-btrfs:vztmpl/alpine-3.18-default_20230607_amd64.tar.xz"
                storage             = "local-btrfs"
                size                = "512M"
                bridge              = "vmbr1"
            }
            tensorflow = {
                vmid                = 108
                hostname            = "tensorflow"
                ostemplate          = "local-btrfs:vztmpl/alpine-3.18-default_20230607_amd64.tar.xz"
                storage             = "local-btrfs"
                size                = "512M"
                bridge              = "vmbr1"
            }
        }
    }

    vms = lookup(local.resource_map, "vms", {})
    lxc = lookup(local.resource_map, "lxc", {})
}
