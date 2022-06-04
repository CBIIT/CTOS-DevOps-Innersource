# CTOS-DevOps-Innersource

To-do:

- updating variable descriptions
- updating output descriptions
- updating security group descriptions
- updating iam role and policy descriptions
- creating reference architectures
- updating module documentation
- creating examples

- what is the innersource?
- what's available in the innersource (documentation, examples)?
- for tf, what do we avoid putting in modules?
- what are our naming conventions?
- when do we use variables? locals? data sources?
- how do we control change? 
- how do we safely allow others to contribute?
- how do we use tags?
- how can users easily create tfvars files?


## Module Variable Naming Conventions

- Don't include the name of the service in the variable name if you do not have to. Instead, apply a variable name that closely resembles the provider service argument or choose a name that is more descriptive of the provider service argument. 
- - For example, The OpenSearch resource offered by the AWS provider has an argument called "zone_awareness_enabled". Don't name a variable for this argument "opensearch_zone_awareness_enabled". Instead, use the argument name as it is, or give it a more descriptive name like "multi_az_enabled".

