module "cluster" {
    source          = "./modules/cluster"
    clusters        = local.clusters
}
