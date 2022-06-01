# CTOS-DevOps-Innersource

placeholder 

## Module Variable Naming Conventions

- Don't include the name of the service in the variable name if you do not have to. Instead, apply a variable name that closely resembles the provider service argument or choose a name that is more descriptive of the provider service argument. 
- - For example, The OpenSearch resource offered by the AWS provider has an argument called "zone_awareness_enabled". Don't name a variable for this argument "opensearch_zone_awareness_enabled". Instead, use the argument name as it is, or give it a more descriptive name like "multi_az_enabled".

