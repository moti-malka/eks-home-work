#!/bin/bash
# A Bash script to deploy home work environment.

cd IaC/

echo 'Initialize Terraform workspace'
terraform init

echo 'Provision the EKS cluster'
terraform apply -auto-approve

echo 'Configure kubectl'
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)