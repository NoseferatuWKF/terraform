# TODO: use map instead
resource "kind_cluster" "primary" {
    name = "primary"
    wait_for_ready = true

    kind_config {
        kind        = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"

        node {
            role = "control-plane"

            kubeadm_config_patches = [
              "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
            ]
        }

        node {
            role = "worker"
        }
}

resource "kind_cluster" "secondary" {
    name = "secondary"
    wait_for_ready = true

    kind_config {
        kind        = "Cluster"
        api_version = "kind.x-k8s.io/v1alpha4"

        node {
            role = "control-plane"

            kubeadm_config_patches = [
              "kind: InitConfiguration\nnodeRegistration:\n  kubeletExtraArgs:\n    node-labels: \"ingress-ready=true\"\n"
            ]
        }

        node {
            role = "worker"
        }
}
