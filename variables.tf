variable "labels" {
  default = {}
}
variable "pvc_name" {}
variable "pvc_namespace" {}
variable "storage_capacity" {
  default = "10Gi"
}
variable "access_mode" {
  default = "ReadWriteOnce"
}

variable "iscsi_target_portal" {}
variable "iscsi_iqn" {}
variable "iscsi_fs_type" {
  default = "ext4"
}
variable "iscsi_lun" {
  default = 0
}
