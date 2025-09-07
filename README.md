Azure CI/CD Starter Kit

A Terraform-based starter kit to deploy Azure Storage resources with CI/CD automation via GitHub Actions.
This project demonstrates how to combine Infrastructure as Code (IaC) with continuous delivery pipelines, providing a reusable foundation for cloud automation projects.

Features

Creates an Azure Resource Group

Deploys a Storage Account (Standard LRS)

Creates a private Storage Container

Configures a Storage Management Policy to auto-delete block blobs older than 30 days

Fully automated CI/CD pipeline with GitHub Actions

 Prerequisites

Azure CLI

Terraform v1.3+

GitHub account

Azure Service Principal for authentication

 Environment Variables / Secrets


AZURE_CLIENT_ID=<your-client-id>
AZURE_CLIENT_SECRET=<your-client-secret>
AZURE_TENANT_ID=<your-tenant-id>
AZURE_SUBSCRIPTION_ID=<your-subscription-id>


Important: Never commit secrets. Add .env to .gitignore.

 Project Structure
.
├── main.tf                 # Terraform main configuration
├── variables.tf            # Terraform input variables
├── terraform.tfvars        # Variable values
├── .gitignore              # Ignore sensitive files
├── README.md               # Documentation
└── .github/workflows/
    └── deploy.yml          # GitHub Actions workflow

Terraform Usage

Initialize Terraform:

terraform init


Preview planned changes:

terraform plan


Apply changes:

terraform apply -auto-approve

 GitHub Actions CI/CD

Trigger: Push to main branch

Workflow steps:

Checkout repository

Setup Terraform

Authenticate to Azure using secrets

Run terraform init, plan, and apply

This ensures infrastructure is deployed consistently and automatically on every update.

Recommended .gitignore
# Terraform
*.tfstate
*.tfstate.backup
.terraform/
.terraform.lock.hcl

# IDE / Editors
.vscode/
.idea/

# Logs
*.log

 With this setup, anyone can:

Fork/clone the repo

Configure secrets in GitHub Actions

Deploy Azure Storage resources with a full CI/CD pipeline