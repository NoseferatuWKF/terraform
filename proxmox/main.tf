module "vm" {
    source                  = "./modules/vm"
    vms                     = local.vms
}

module "lxc"{
    source                  = "./modules/lxc"
    lxc                     = local.lxc
}
