targetScope = 'subscription'

resource requireTag 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'require-costcenter-tag'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Require CostCenter Tag'

    policyRule: {
      if: {
        field: 'tags[CostCenter]'
        exists: false
      }
      then: {
        effect: 'deny'
      }
    }
  }
}
