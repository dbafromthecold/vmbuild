variable "vm_template" {
    type = string
    description = "Template to build new server from"
}
variable "server_name" {
    type = string
    description = "Name of the server"
}
variable "ip_address" {
    type = string
    description = "IP Address of the server"
}
variable "cpu" {
    type = number
    description = "Number of CPUs"
    default = 2
}
variable "memory" {
    type = number
    description = "Amount of RAM"
    default = 4096
}
variable "vsphere_user" {
    type = string
    description = "vSphere user"
}
variable "vsphere_password" {
    type = string
    description = "Password for vSphere user"
}
variable "local_admin_password" {
    type = string
    description = "Password for local VM admin"
}
variable "domain_admin_password" {
    type = string
    description = "Password for domain admin"
}
variable "commands" {
    type = list(string)
    description = "Commands to be run at first log in"
}
variable "disk1_size" {
    type = number
    description = "Size (GB) of Disk 1"
    default = 50
}
variable "disk2_size" {
    type = number
    description = "Size (GB) of Disk 2"
    default = 50
}