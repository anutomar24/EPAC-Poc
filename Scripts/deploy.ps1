#Create three policies and assign them individually to subscritpion scope.
#Step 1: deploy policy to enforce https for web applications
az deployment sub create `
    --name enforceHttpsPolicyDeployment `
    --location northeurope `
    --template-file Policies/enforce-https.bicep
#Assign policy to subscription scope
az policy assignment create `
    --name enforceHttpsPolicyAssignment `
    --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6 `
    --policy /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6/providers/Microsoft.Authorization/policyDefinitions/enforce-https-only

#Step 2: deploy policy to deny public network access for storage accounts
az deployment sub create `
    --name denyPublicNetworkPolicyDeployment `
    --location northeurope `
    --template-file Policies/deny-public-network.bicep

#Assign policy to subscription scope
az policy assignment create `
    --name denyPublicNetworkPolicyAssignment `
    --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6 `
    --policy /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6/providers/Microsoft.Authorization/policyDefinitions/deny-public-network

#Step 3: deploy policy to enforce tag on resource groups
az deployment sub create `
    --name enforceTagPolicyDeployment `
    --location northeurope `
    --template-file Policies/require-tag.bicep

#Assign policy to subscription scope
az policy assignment create `
    --name enforceTagPolicyAssignment `
    --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6 `
    --policy /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6/providers/Microsoft.Authorization/policyDefinitions/require-costcenter-tag
