targetScope = 'subscription'
module https './policies/enforce-https.bicep' = {
  name: 'httpsPolicy'
}

module public './policies/deny-public-network.bicep' = {
  name: 'publicPolicy'
}

module tags './policies/require-tag.bicep' = {
  name: 'tagPolicy'
}

module initiative './initiatives/enterprise-baseline.bicep' = {
  name: 'initiativeModule'

  dependsOn: [
    https
    public
    tags
  ]
}

module assignment './assignments/assign-baseline.bicep' = {
  name: 'assignmentModule'

  dependsOn: [
    initiative
  ]
}
