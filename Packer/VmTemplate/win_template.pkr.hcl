# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

packer {
  required_plugins {
    windows-update = {
      version = "0.15.0"
      source = "github.com/rgl/windows-update"
    }
  }
}

# source blocks are generated from your builders; a source can be referenced in
# build blocks. A build block runs provisioner and post-processors on a
# source. Read the documentation for source blocks here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/source
# https://github.com/hashicorp/packer-plugin-vsphere/blob/main/builder/vsphere/examples/windows/windows-10.pkr.hcl 
# answer file using generic product key - https://learn.microsoft.com/en-us/windows-server/get-started/kms-client-activation-keys
source "vsphere-iso" "z-ap-template-build" {
//vSphere configuration
  vcenter_server = "XXXXXXXXXXXXXXXX"
  cluster              = "XXXXXXXXXXXXXXXX"
  host                 = "XXXXXXXXXXXXXXXX"
  resource_pool        = "XXXXXXXXXXXXXXXX"
  folder               = "XXXXXXXXXXXXXXXX"
  datastore            = "XXXXXXXXXXXXXXXX"
  username             = var.vsphere_user
  password             = var.vsphere_password
  insecure_connection  = "true"
  iso_paths            = var.iso_paths
//VM settings
  vm_name              = "z-ap-template-01"
  communicator         = "winrm"
  winrm_username       = var.win_user
  winrm_password       = var.win_password
  CPUs                 = 2
  RAM                  = 4096
  RAM_reserve_all      = true
  firmware             = "bios"
  guest_os_type        = "windows9Server64Guest"
  boot_order           = "cdrom,disk"
  disk_controller_type = ["pvscsi"]
  storage {
    disk_size             = 102400
    disk_thin_provisioned = true
  }
  network_adapters {
    network      = "VM Network"
    network_card = "vmxnet3"
  }
//Setup scripts
  floppy_files = var.floppy_files
}

# a build block invokes sources and runs provisioning steps on them. The
# documentation for build blocks can be found here:
# https://www.packer.io/docs/templates/hcl_templates/blocks/build
build {
  sources = ["source.vsphere-iso.z-ap-template-build"]
  
  provisioner "windows-update" {
    search_criteria = "IsInstalled=0"
    filters = [
      "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 50
  }   

  post-processor "vsphere-template" {
    host                 = "XXXXXXXXXXXXXXXX"
    username             = var.vsphere_user
    password             = var.vsphere_password
    insecure             = true
    folder              = "/XXXXXXXXXXXXXXXX"
  }
}