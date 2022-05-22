# WHERE IN Apex Action

Apex provides the ability to use bind variables in [Dynamic SOQL queries](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_dynamic_soql.htm). Bind variables makes finding related records extremely simple when taking advantage of lists in conjunction with the WHERE [...] IN clause. Essentially—as an example—given a list of Accounts, get all related Cases for those accounts. This invocable Apex action allows you to easily bring this capability into your Flows.

## What To Do

1. Install this package using the link below
2. Add one or more users to the included Permission Set. This will grant access to the Apex class necessary for using this action
3. In Flow Builder, create your flow and include the WHERE IN Apex action. Set your input values appropriately. The action will return an SObject record collection which you can then iterate over back in your Flow. 

## Deploy to Your Org

### Disclaimer

**This package is provided without warranty.**
This software has not been fully tested nor developed with strict security and access controls in mind. By installing this package in your org, you assume all risk of consequences and agree not to hold myself or my employer liable.

To deploy this package to you Salesforce environment, use the [Salesforce DX Public Deployer](https://hosted-scratch.herokuapp.com/byoo?template=https://github.com/thisisjohnny/sf-wherein-action) and choose the option best for you.

----
_Made with_ ❤️ _in Reston_