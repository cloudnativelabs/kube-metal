module "bootkube" {
  source = "./modules/bootkube"

  cluster_name = "${var.cluster_name}"

  #TODO: Dynamically determine apiservers from nodes, set to a variable
  api_servers                   = ["${packet_device.controller.0.hostname}"]
  asset_dir                     = "${var.asset_dir}"
  etcd_servers                  = ["${var.etcd_servers}"]
  experimental_self_hosted_etcd = "${var.experimental_self_hosted_etcd}"
  container_images              = {
                                    hyperkube = "quay.io/coreos/hyperkube:v${null_resource.kubernetes_facts.triggers.kubernetes_v_patch}_coreos.0"
                                    etcd = "quay.io/coreos/etcd:v3.1.8"
                                  }
}
