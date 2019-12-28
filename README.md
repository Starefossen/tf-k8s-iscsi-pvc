# Terraform Kubernetes Iscsi PVC

Terraform Module to Create Iscsi backed Persistent Volume (PV) and [Persistent
Volume Claim][k8s_vpc] (PVC).

[k8s_vpc]: https://kubernetes.io/docs/concepts/storage/persistent-volumes/

## Terraform versions

This module only supports Terraform v0.12.

## Usage

```hcl
module "iscsi_pvc" {
  source = "github.com/starefossen/tf-k8s-iscsi-pvc"

  pvc_name         = "my-volume"
  pvc_namespace    = "my-namespace"
  storage_capacity = "10Gi"
  access_mode      = "ReadWriteOnce"

  iscsi_target_portal = "1.2.3.4:3260"
  iscsi_iqn           = "iqn.0000-00.com.nnn:aa-bbbbb:iscsi.mydata.00000"
  iscsi_fs_type       = "ext4"
  iscsi_lun           = 0
}
```

## Inputs

| Name                  | Description           | Type   | Default           | Required |
|-----------------------|-----------------------|--------|-------------------|----------|
| `pvc_name`            | PVC name              | string |                   | yes      |
| `pvc_namespace`       | PVC namespace         | string |                   | yes      |
| `storage_capacity`    | PVC capacity          | string | `"10Gi"`          | no       |
| `access_mode`         | PVC access mode       | string | `"ReadWriteOnce"` | no       |
| `iscsi_target_portal` | Iscsi target portal   | string |                   | yes      |
| `iscsi_iqn`           | Iscsi IQN             | string |                   | yes      |
| `iscsi_fs_type        | Iscsi filesystem type | string | `"ext4"`          | no       |
| `iscsi_lun`           | Iscsi nun number      | string | `0`               | no       |

## Outputs

| Name         | Description    |
| ------------ | -------------  |
| `claim_name` | PVC claim name |

## License

[MIT](./LICENSE]
