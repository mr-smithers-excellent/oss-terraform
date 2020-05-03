# Terraform OSS 

Terraform scripts for open source projects

## Package structure

## Resources

* VPC
* OpenVPN Access Server
* RDS
* AWS Elasticsearch
    
## Creation order

These Terraform scripts make use of [terraform-remote-state](https://www.terraform.io/docs/providers/terraform/d/remote_state.html) to retrieve VPC details for dependent resources. As such, they must be run in a particular order:

1. Create the VPC `global/vpc`
2. Create the OpenVPN server `global/openvpn`

## Terraform Cloud
