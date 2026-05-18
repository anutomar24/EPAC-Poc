targetScope = 'subscription'

resource assignment 'Microsoft.Authorization/policyAssignments@2022-06-01' = {
  name: 'assign-enterprise-baseline'

  properties: {
    displayName: 'Assign Enterprise Governance Baseline'

    policyDefinitionId: subscriptionResourceId(
      'Microsoft.Authorization/policySetDefinitions',
      'enterprise-governance-baseline'
    )
  }
}
