# CTOS-DevOps-Innersource

Module Development To-Do:
- config rules for opensearch
- config rules for alb
- config rules for s3
- config rules for ecs

Module Governance To-Do:
- updating variable descriptions
- updating output descriptions
- updating security group descriptions
- updating iam role and policy descriptions
- creating reference architectures
- updating module documentation
- creating examples

InnerSource To-Do:
- what is the innersource?
- what's available in the innersource (documentation, examples)?
- for tf, what do we avoid putting in modules?
- what are our naming conventions? (app-service-tier nomenclature)
- when do we use variables? locals? data sources?
- how do we control change? 
- how do we safely allow others to contribute?
- how do we use terraform tags? would it be worth it to create a tags module?
- how can users easily create tfvars files?
- how can we version our modules with releases to ease change management?
- how can we document release changes easily? Is there an action for release notes?
- how can we protect the main branch?
- how can we set-up review processes for pull requests?
- when is it best to include data sources in the module? when is it not?
- do we have a standard template for our "examples" files?


## Module Variable Naming Conventions

- Don't include the name of the service in the variable name if you do not have to. Instead, apply a variable name that closely resembles the provider service argument or choose a name that is more descriptive of the provider service argument. 
- - For example, The OpenSearch resource offered by the AWS provider has an argument called "zone_awareness_enabled". Don't name a variable for this argument "opensearch_zone_awareness_enabled". Instead, use the argument name as it is, or give it a more descriptive name like "multi_az_enabled".

