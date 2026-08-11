$ErrorActionPreference = "Stop"

Write-Host "========================================"
Write-Host "Destroying SRE Assessment Infrastructure"
Write-Host "========================================"

Set-Location "$PSScriptRoot\..\terraform"

terraform destroy -var-file="dev.tfvars"
terraform output
az group list --output table

Write-Host ""
Write-Host "========================================"
Write-Host "Terraform destroy completed."
Write-Host "========================================"