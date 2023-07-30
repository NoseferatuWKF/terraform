locals {
    clusters = {
        primary = {
            name    = "primary"
            nodes   = [
                {
                    role                    = "control-plane"
                    kubeadm_config_patches  = [
                    <<-EOT
                        kind: InitConfiguration
                        nodeRegistration: 
                        kubeletExtraArgs: 
                        node-labels: "ingress-ready=true"
                    EOT
                    ]
                },
                {
                    role                    = "worker"
                    kubeadm_config_patches  = []
                }
            ]
        }
        secondary = {
            name    = "secondary"
            nodes   = [
                {
                    role                    = "control-plane"
                    kubeadm_config_patches  = [
                    <<-EOT
                        kind: InitConfiguration
                        nodeRegistration: 
                        kubeletExtraArgs: 
                        node-labels: "ingress-ready=true"
                    EOT
                    ]
                },
                {
                    role = "worker"
                    kubeadm_config_patches  = []
                }
            ]
        }
    }
}

