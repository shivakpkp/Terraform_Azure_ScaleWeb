# Terraform Azure Scale Web App

This repository contains Terraform code to deploy a scalable web application on Azure. The infrastructure includes Virtual Machine Scale Sets, Load Balancers, Virtual Networks, and other Azure resources. The project is modularized for reusability and ease of management.

---

## Project Structure

---

## Modules

### 1. **LoadBalancer**
- **Path:** `module/LoadBalancer/`
- **Description:** Configures an Azure Load Balancer.
- **Inputs:**
  - `frontend_port`: Frontend port for the Load Balancer.
  - `backend_port`: Backend port for the Load Balancer.
  - `PublicIPAddress_name`: Name of the public IP address.
- **Outputs:**
  - `lb_id`: The ID of the Load Balancer.

### 2. **Scale-Set**
- **Path:** `module/Scale-Set/`
- **Description:** Deploys an Azure Virtual Machine Scale Set.
- **Inputs:**
  - `vmss_name`: Name of the scale set.
  - `resource_group_name`: Name of the resource group.
  - `location`: Azure region.
  - `instance_count`: Number of VM instances.
  - `subnet_id`: Subnet ID for the scale set.
  - `bk_pool_id`: Backend pool ID for the Load Balancer.
- **Outputs:**
  - `vmss_id`: The ID of the Virtual Machine Scale Set.

---

## Variables

### Global Variables (Defined in `env/dev/variables.tf`)
- **`Vnet_name`**: Name of the Virtual Network.
- **`location`**: Azure region for the resources.
- **`resource_group_name`**: Name of the resource group.
- **`address_space`**: Address space for the Virtual Network.
- **`subnets`**: Map of subnets to be created in the Virtual Network.
- **`nsg_name`**: Name of the Network Security Group.
- **`security_rule`**: List of security rules for the Network Security Group.

### Scale-Set Specific Variables (Defined in `module/Scale-Set/variable.tf`)
- **`vmss_name`**: Name of the Virtual Machine Scale Set.
- **`instance_count`**: Number of VM instances in the scale set.
- **`subnet_id`**: Subnet ID for the scale set.
- **`bk_pool_id`**: Backend pool ID for the Load Balancer.

---

## Usage

### Initialize Terraform
Run the following command to initialize Terraform:
```sh
terraform init
terraform plan
terraform apply
terraform destroy