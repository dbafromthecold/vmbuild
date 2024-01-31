# https://registry.terraform.io/modules/Terraform-VMWare-Modules/vm/vsphere/latest

module "apruski-vm-terraform" {
  source                = "Terraform-VMWare-Modules/vm/vsphere"
//vSphere configuration
  dc                    = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  vmrp                  = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  vmfolder              = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  datastore             = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  vmtemp                = var.vm_template
  instances             = 1
//VM configuration
  vmname                = var.server_name
  vmnameformat          = "-%02d" # used when creating multiple VMs
  windomain             = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  domain_admin_user     = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  domain_admin_password = var.domain_admin_password
  auto_logon            = true
  orgname               = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  is_windows_image      = true
  firmware              = "bios"
  local_adminpass       = var.local_admin_password
  cpu_number            = var.cpu
  ram_size              = var.memory
  io_share_level        = ["normal", "normal"] # fix for weird error
  scsi_bus_sharing      = "noSharing"
  scsi_type             = "pvscsi"
  scsi_controller       = 0
  enable_disk_uuid      = true
  data_disk = {
    disk1 = {
      size_gb                   = var.disk1_size,
      thin_provisioned          = true,
      data_disk_scsi_controller = 0
    },
    disk2 = {
      size_gb                   = var.disk2_size,
      thin_provisioned          = true,
      data_disk_scsi_controller = 0
    }
  }
  network = {
    "VM Network" = [var.ip_address]
  }
  ipv4submask      = ["XX"]
  network_type     = ["vmxnet3"]
  dns_server_list  = ["XXX.XXX.XXX.XXX"]
  vmgateway        = "XXX.XXX.XXX.XXX"
//Setup scripts
  run_once         = var.commands
}