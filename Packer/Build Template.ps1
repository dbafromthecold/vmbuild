############################################################################
############################################################################
##
## Andrew Pruski
## apruski@purestorage.com
## Virtual Machine Template creation using packer
##
############################################################################
############################################################################

# install vsphere plugin
packer plugins install github.com/hashicorp/vsphere


# naviage to files
Set-Location ..\vmbuild\Packer\VmTemplate


# initialise template
packer init win_template.pkr.hcl


# validate configuration files
packer validate .


# build template
packer build .