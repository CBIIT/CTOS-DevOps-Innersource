# CTOS-DevOps-Innersource


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

## Tags (notes):

Maybe we should say that the "Name" tag is handled in the module, the rest are handled in the consuming project (default/alt tags?)

- Name
  - human-readable resource name. note that the AWS Console UI displays the case-sensitive "Name" tag.
- app
  - name of the app using the resource
- app-role?
  - the resources technical function (webserver, database, etc.)
- app-purpose
  - the resource's business function or purpose (front-end ui, payment processor, etc.)
- environment
  - the tier
- ops-model
  - CBIIT-managed, Partner-managed
- managed-by
  - terraform
- program
  - crdc, ccdi, etc.
- customer
  - ODS
- cost-center
  - who's paying the bill?
- automation-exclude?
  - true/false value for automation not to modify the resource?
- pii
  - true/false
- phi 
  - true/false
- fisma-risk-category
  - low/moderate
- dev-lead
  - lead developer for the project
- project-manager
  - name of the pm managing the project


