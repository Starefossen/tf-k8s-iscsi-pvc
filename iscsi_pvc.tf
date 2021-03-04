locals {
  labels = {
    "app.kubernetes.io/managed-by" = "terraform"
    "app.kubernetes.io/name"       = var.pvc_name
  }
}

resource "kubernetes_persistent_volume" "iscsi" {
  metadata {
    name   = var.pvc_name
    labels = merge(local.labels, var.labels)
  }
  spec {
    capacity = {
      storage = var.storage_capacity
    }
    access_modes = [var.access_mode]
    persistent_volume_source {
      iscsi {
        target_portal = var.iscsi_target_portal
        iqn           = var.iscsi_iqn
        fs_type       = var.iscsi_fs_type
        lun           = var.iscsi_lun
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "iscsi" {
  metadata {
    name      = var.pvc_name
    namespace = var.pvc_namespace
    labels    = merge(local.labels, var.labels)
  }
  spec {
    access_modes = [var.access_mode]
    resources {
      requests = {
        storage = var.storage_capacity
      }
    }
    volume_name = kubernetes_persistent_volume.iscsi.metadata.0.name
  }
}
