targetScope = 'subscription'

resource denyPublic 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'deny-public-network'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Deny Public Network Access'

    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Storage/storageAccounts'
          }
          {
            field: 'Microsoft.Storage/storageAccounts/publicNetworkAccess'
            equals: 'Enabled'
          }
        ]
      }
      then: {
        effect: 'deny'
      }
    }
  }
}
