public with sharing class WhereInAction {

    @InvocableMethod(label='Get Collection WHERE IN' description='Gets all records of an associated sObject where records are in a provided record collection. E.g. SELECT Id FROM Case WHERE Account IN :acctList')
    public static List<Results> execute (List<Requests> requestList) {
        List<Results> responseWrapper = new List<Results>();

        for(Requests curRequest : requestList) {
            Results results = new Results();
            
            List<SObject> collection = curRequest.requestCollection;
            String queryFields;
            if (curRequest.queryFields == null || curRequest.queryFields == '') { 
                queryFields = 'Id'; 
            } else {
                queryFields = curRequest.queryFields;
            }
            String lookupReferenceApiName = curRequest.lookupReferenceApiName;
            String objectApiName = curRequest.objectApiName;

            String soqlQuery = 'SELECT ' + queryFields + ' FROM ' + objectApiName + ' WHERE ' + lookupReferenceApiName + ' IN :collection';
            List<SObject> queryResult = Database.query(soqlQuery);
            if (queryResult.size() > 0) {
                results.resultsList = queryResult;
            }
            responseWrapper.add(results);
        }
        return responseWrapper;
    }

    public class Requests {
        @InvocableVariable(label='Record Collection Input' description='Record Collection variable you are using to find related records. E.g. WHERE [...] IN {!Get_Accounts}' required=true)
        public List<SObject> requestCollection;

        @InvocableVariable(label='Fields to Query (comma-separated) [E.g. Id, Status, My_Custom_Field__c' description='Comma-separated list of fields to query. E.g. SELECT Id, Status, MyCustomField__c [...]')
        public String queryFields;

        @InvocableVariable(label='Object API Name to Query' description='API name of the object you are querying against. E.g. SELECT [...] FROM Case [...]' required=true)
        public String objectApiName;
        
        @InvocableVariable(label='Lookup Reference Field API Name' description='API name of the field holding the lookup value to key on. E.g. [...] WHERE AccountId IN [...]' required=true)
        public String lookupReferenceApiName;
    }

    public class Results {
        @InvocableVariable(label='Record Collection Results' description='Record Collection variable of related records returned from the query.' required=true)
        public List<SObject> resultsList;
    }
}
