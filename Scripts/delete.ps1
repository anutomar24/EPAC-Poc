<#   az policy assignment delete --name denyPublicNetworkPolicyAssignment --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6
   az policy definition delete --name deny-public-network
   
   az policy assignment delete --name enforceHttpsPolicyAssignment --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6
   az policy definition delete --name enforce-https-only
   
   az policy assignment delete --name enforceTagPolicyAssignment --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6
   az policy definition delete --name require-costcenter-tag
   #>

   #delete policy initiative assignment
   az policy assignment delete --name assign-enterprise-baseline --scope /subscriptions/1cce49eb-149c-44f4-8c11-763dc5455ee6
   
   #delete initiative definition
   az policy set-definition delete --name enterprise-governance-baseline 

   #delete policy definitions
   az policy definition delete --name deny-public-network
   az policy definition delete --name require-costcenter-tag
   az policy definition delete --name enforce-https-only