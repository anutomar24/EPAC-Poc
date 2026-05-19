# EPAC-Poc
This repository contains Infrastructure as Code (IaC) templates and scripts for managing Azure resources. It includes Bicep files for policy definitions, initiatives, and assignments, as well as PowerShell scripts for deployment and cleanup tasks.

main.bicep
   ↓
deploys:
- policy definitions
- initiative
- assignment

Command to deploy main.bicep:
az deployment sub create --name epacMainDeployment --location northeurope --template-file main.bicep