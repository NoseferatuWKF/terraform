module "core" {
    source                  = "./modules/core"
    core                    = local.core
}

module "pop" {
    source                  = "./modules/pop"
    pop                     = local.pop
}

module "nix" {
    source                  = "./modules/nix"
    nix                     = local.nix
}

module "kali" {
    source                  = "./modules/kali"
    kali                    = local.kali
}

module "lxc"{
    source                  = "./modules/lxc"
    lxc                     = local.lxc
    lxc_public_key          = var.lxc_public_key
}

