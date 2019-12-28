output "claim_name" {
  value = kubernetes_persistent_volume_claim.iscsi.metadata.0.name
}
