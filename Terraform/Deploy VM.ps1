############################################################################
############################################################################
##
## Andrew Pruski
## apruski@purestorage.com
## Virtual Machine Deployment using terraform
##
############################################################################
############################################################################


# navigate to terraform directory
Set-Location .\vmbuild\\terraform


# init repository
terraform init


# validate config files
terraform validate


# inspect actions
terraform plan


# build VM
terraform apply -auto-approve #careful with automatically approving build!



