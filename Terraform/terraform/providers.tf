provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = "XXXXXXXXXXXXXXXXXXXXXXXXX"
  allow_unverified_ssl = true
}