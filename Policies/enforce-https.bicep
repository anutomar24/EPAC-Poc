targetScope = 'subscription'

resource enforceHttps 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: 'enforce-https-only'
  properties: {
    policyType: 'Custom'
    mode: 'Indexed'
    displayName: 'Enforce HTTPS Only'
    description: 'Ensures HTTPS is enabled on App Services'

    policyRule: {
      if: {
        allOf: [
          {
            field: 'type'
            equals: 'Microsoft.Web/sites'
          }
          {
            field: 'Microsoft.Web/sites/httpsOnly'
            equals: false
          }
        ]
      }
      then: {
        effect: 'deny'
      }
    }
  }
}
