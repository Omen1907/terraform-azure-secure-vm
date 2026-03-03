## Project Overview
This repository contains a **Terraform project for deploying a virtual machine (VM) on Azure**.  
It demonstrates Infrastructure as Code (IaC) skills, including VM provisioning, network configuration, and managing Azure resources programmatically.

---

## Contents
- `main.tf` – Terraform configuration for VM, network interface, and related resources.  
- `variables.tf` – Input variables for the project.  
- `outputs.tf` – Outputs such as public IP and VM name.  
- `.gitignore` – Ensures sensitive files (state, credentials, providers) are not pushed.  

---

## Usage
1. Install [Terraform](https://www.terraform.io/downloads).  
2. Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).  
3. Authenticate with Azure:
    ```bash
    az login
    ```
4. Initialize Terraform:
    ```bash
    terraform init
    ```
5. Plan deployment:
    ```bash
    terraform plan
    ```
6. Apply deployment:
    ```bash
    terraform apply
    ```

---

## Errors Encountered
During development and deployment, the following errors were observed (deduplicated):

### 1. Quota Exceeded
Operation could not be completed as it results in exceeding approved Standard_Bpsv2Family Cores quota.

Cause: Subscription limits exceeded for the requested VM size.
Resolution: Adjusted VM size to fit within available quota.

### 2. Unsupported Argument
Error: Unsupported argument
on main.tf line 63, in resource "azurerm_network_interface" "vm_nic":
network_security_group_id = azurerm_network_security_group.nsg.id

Cause: Argument not valid for the provider version used.
Resolution: Attached NSG through the ip_configuration block instead.

### 3. DeploymentFailed
At least one resource deployment operation failed.

Cause: Missing dependent resources or invalid references.
Resolution: Verified resource names, dependencies, and ensured the resource group exists.

### 4. SSH / Access Issues
ssh -i <key> user@<ip> fails / connection refused

Cause: NSG rules or public IP not properly configured.
Resolution: Updated NSG rules to allow port 22 and confirmed the public IP assignment.

### 5.  Provider / Local Environment
.local/.terraform/providers folder present

Resolution: Added .terraform/ to .gitignore to avoid pushing local binaries.
