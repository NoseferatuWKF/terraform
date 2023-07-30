resource "kind_cluster" "clusters" {
    for_each        = var.clusters
    name            = each.value.name
    wait_for_ready  = true

    kind_config {
        kind        = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"

        dynamic "node" {
            for_each        = each.value.nodes
            content {
                role                    = node.value.role
                kubeadm_config_patches  = node.value.kubeadm_config_patches
            }
        }
    }
}
