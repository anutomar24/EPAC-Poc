# Create 3 policies and group them together in an initiative. Then assign the initiative to subscription scope.
#===============================================================================================================
#Step 1: deploy policy to enforce https for web applications
az deployment sub create `
    --name enforceHttpsPolicyDeployment `
    --location northeurope `
    --template-file Policies/enforce-https.bicep


#Step 2: deploy policy to deny public network access for storage accounts
az deployment sub create `
    --name denyPublicNetworkPolicyDeployment `
    --location northeurope `
    --template-file Policies/deny-public-network.bicep



#Step 3: deploy policy to enforce tag on resource groups
az deployment sub create `
    --name enforceTagPolicyDeployment `
    --location northeurope `
    --template-file Policies/require-tag.bicep


#step 4: deploy initiative to group policies together
az deployment sub create `
    --name enterpriseBaselineDeployment `
    --location northeurope `
    --template-file Initiatives/enterprise-baseline.bicep

#step 5: assign initiative to subscription scope
az policy assignment create `
    --name enterpriseBaselineAssignment `
    --display-name "Enterprise Baseline Assignment" `
    --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6 `
    --policy-set-definition /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6/providers/Microsoft.Authorization/policySetDefinitions/enterprise-governance-baseline