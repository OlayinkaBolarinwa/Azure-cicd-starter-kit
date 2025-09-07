Azure CI/CD Starter Kit

A Terraform-based starter kit for deploying Azure infrastructure with a GitHub Actions CI/CD workflow. This project helps developers and startups quickly provision and manage Azure resources with a production-ready pipeline.

Features

Deploy Azure Resource Group, Storage Account, and Blob Container.

Automatically generate unique names using random_id.

Azure Storage Management Policy for automated cleanup of blobs.

GitHub Actions workflow to manage Terraform plan and apply.

Terraform backend configured with Azure Blob Storage for remote state.

Prerequisites

Terraform >= 1.3.0

Azure CLI

GitHub account (for GitHub Actions)

An Azure subscription

Getting Started
Clone the repository
git clone https://github.com/OlayinkaBolarinwa/Azure-cicd-starter-kit.git
cd Azure-cicd-starter-kit

Configure Azure CLI
az login
az account set --subscription <your-subscription-id>

Initialize Terraform
terraform init -reconfigure

Plan and Apply Terraform
terraform plan
terraform apply


Terraform will output:

resource_group_name

storage_account_name

storage_container_name

GitHub Actions Workflow

The workflow is located in .github/workflows/deploy.yml and automatically:

Runs Terraform plan on pull requests.

Runs Terraform apply on merge to main.

Make sure your GitHub repository has secrets configured for Azure authentication:
AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID, AZURE_SUBSCRIPTION_ID.

Variables

All configurable variables are in Variable.tf:

Variable	Description	Example
resource_group	Base name for the resource group	"my-cicd-rg"
location	Azure region	"westus2"
storage_account_name	Base name for storage account	"mycicdstorage001"
storage_container_name	Base name for storage container	"my-starterkit-container"
Cleanup

To destroy all resources created:

terraform destroy

Contributing

Fork the repository.

Create a feature branch:

git checkout -b feature/my-feature


Commit your changes:

git commit -am "Add new feature"


Push to the branch:

git push origin feature/my-feature


Open a Pull Request.

License

MIT License © Olayinka Bolarinwa
