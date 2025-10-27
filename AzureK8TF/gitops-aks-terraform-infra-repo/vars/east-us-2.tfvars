# File providing the variables for the Terraform configuration for the East US 2 region

resource_group_name     = "myAksResourceGroup"
resource_group_location = "eastus2"
aks_cluster_name        = "myAksCluster"
dns_prefix              = "myaksdns"
vm_size                 = "standard_d2ads_v6"
