variable "vsphere_user" {
    type = string
    description = "vSphere user"
    default = "administrator" # default nonsense values added otherwise packer validate throws a hissy fit
}
variable "vsphere_password" {
    type = string
    description = "Password for vSphere user"
    default = "Password1122"
}
variable "win_user" {
    type = string
    description = "Windows user"
    default = "Administrator"
}
variable "win_password" {
    type = string
    description = "Password for windows user"
    default = "Password1122"
}
variable "iso_paths" {
    type = list(string)
    description = "List of paths to required ISO files"
    default = ["C:/git/"]
}
variable "floppy_files" {
    type = list(string)
    description = "List of paths to required setup scripts"
    default = ["C:/git/"]
}