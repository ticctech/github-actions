
az ts create \
  --name ts-containerapp \
  --version "1.0" \
  --resource-group "app-ticc-stg-ae-rg" \
  --location "australiaeast" \
  --template-file "./bicep/containerapp.bicep"

az ts create \
  --name ts-api \
  --version "1.0" \
  --resource-group "app-ticc-stg-ae-rg" \
  --location "australiaeast" \
  --template-file "./bicep/api.bicep"


  az bicep publish \
    --file "./bicep/containerapp.bicep" \
    --target br:ticctech.azurecr.io/bicep/modules/containerapp:v1

  az bicep publish \
    --file "./bicep/api.bicep" \
    --target br:ticctech.azurecr.io/bicep/modules/api:v1