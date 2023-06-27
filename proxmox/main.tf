module "vm" {
    source                  = "./modules/vm"
    vms                     = local.vms
    pm_api_url              = var.pm_api_url
    pm_api_token_id         = var.pm_api_token_id
    pm_api_token_secret     = var.pm_api_token_secret
}
