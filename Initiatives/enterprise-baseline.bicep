targetScope = 'subscription'

resource initiative 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = {
  name: 'enterprise-governance-baseline'

  properties: {
    policyType: 'Custom'
    displayName: 'Enterprise Governance Baseline'

    policyDefinitions: [
      {
        policyDefinitionId: subscriptionResourceId(
          'Microsoft.Authorization/policyDefinitions',
          'enforce-https-only'
        )
      }
      {
        policyDefinitionId: subscriptionResourceId(
          'Microsoft.Authorization/policyDefinitions',
          'deny-public-network'
        )
      }
      {
        policyDefinitionId: subscriptionResourceId(
          'Microsoft.Authorization/policyDefinitions',
          'require-costcenter-tag'
        )
      }
    ]
  }
}
