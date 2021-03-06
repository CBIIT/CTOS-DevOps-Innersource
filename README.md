# CTOS-DevOps-Innersource
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/b9b51766ffbc4befb0b2414abebd3d1d)](https://www.codacy.com?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=CBIIT/ctos-cloud-devops&amp;utm_campaign=Badge_Grade)

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

Can use default tags in main aws provider, and add a second provider with additional default tags since the terraform aws provider only allows a max of 10 each. 

<pre><code>provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = {
      app             = "CCDC"
      customer        = "ODS"
      dev_lead        = "Wei Yu"
      fisma           = "Moderate"
      managed_by      = "Terraform"
      ops_model       = "Partner"
      pii             = "True"
      program         = "CCDI"
      project_manager = "Mark Cunningham"
    }
  }
}</code></pre>


- program
  - crdc, ccdi, etc.
- pii
  - true/false
- project-manager
  - name of the pm managing the project


