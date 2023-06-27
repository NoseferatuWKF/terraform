# TODO: clone from template
locals {
    vm_map = {
        vms = {
            # TODO: wireguard
            # TODO: add LAN bridge
            vpn = {
                vmid        = 100
                name        = "vpn"
                target_node = "proxmox"
                iso         = "local-btrfs:iso/pfSense-CE-2.6.0-RELEASE-amd64.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                agent       = 1
                sockets     = 1
                cores       = 1
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                machine     = "q35"
                storage     = "local-btrfs"
                size        = "8G"
                type        = "scsi"
                model       = "virtio"
                bridge      = "vmbr1"
            }
            # TODO: iscsi block partitions
            nas = {
                vmid        = 101
                name        = "NAS"
                target_node = "proxmox"
                iso         = "local-btrfs:iso/TrueNAS-13.0-U5.1.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                agent       = 1
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 8192
                scsihw      = "virtio-scsi-single"
                machine     = "q35"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                model       = "virtio"
                bridge      = "vmbr1"
            }
            # TODO: setup disk passthrough
            windows = {
                vmid        = 102 
                name        = "gaming"
                target_node = "proxmox"
                iso         = "local-btrfs:iso/Win11_22H2_English_x64v2.iso"
                bios        = "ovmf"
                boot        = "order=ide2;scsi0;net0"
                qemu_os     = "win11"
                oncreate    = false
                agent       = 1
                sockets     = 1
                cores       = 8
                cpu         = "host"
                memory      = 16384
                scsihw      = "lsi"
                machine     = "q35"
                storage     = "local-btrfs"
                size        = "100G"
                type        = "sata"
                model       = "virtio"
                bridge      = "vmbr1"
            }
            # TODO: automate post-installtion with ansible container
            # TODO: spice for audio and display
            pop = {
                vmid        = 103 
                name        = "pop-general"
                target_node = "proxmox"
                iso         = "local-btrfs:iso/pop-os_22.04_amd64_intel_30.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                agent       = 1
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                machine     = "q35"
                storage     = "local-btrfs"
                size        = "50G"
                type        = "scsi"
                model       = "virtio"
                bridge      = "vmbr1"
            }
            kubernetes = {
                vmid        = 104 
                name        = "nix-kubernetes"
                target_node = "proxmox"
                iso         = "local-btrfs:iso/nixos-gnome-23.05.1156.ad157fe26e7-x86_64-linux.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                agent       = 1
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                machine     = "q35"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                model       = "virtio"
                bridge      = "vmbr1"
            }
            hacking = {
                vmid        = 105 
                name        = "kali-hacking"
                target_node = "proxmox"
                iso         = "local-btrfs:iso/kali-linux-2023.2a-installer-amd64.iso"
                bios        = "seabios"
                boot        = "order=scsi0;ide2;net0"
                qemu_os     = "l26"
                oncreate    = false
                agent       = 1
                sockets     = 1
                cores       = 2
                cpu         = "host"
                memory      = 4096
                scsihw      = "virtio-scsi-single"
                machine     = "q35"
                storage     = "local-btrfs"
                size        = "32G"
                type        = "scsi"
                model       = "virtio"
                bridge      = "vmbr1"
            }
        }
    }

    vms = lookup(local.vm_map, "vms", {})
}
