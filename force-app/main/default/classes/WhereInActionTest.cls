@istest
public with sharing class WhereInActionTest {
    @TestSetup
    static void makeData(){
        Account acct = new Account(
            Name = 'Test acct'
        );
        insert acct;

        List<Case> caseList = new List<Case>();
        Case case1 = new Case(
            AccountId = acct.Id,
            Subject = 'Example 1'
        );
        caseList.add(case1);

        Case case2 = new Case(
            AccountId = acct.Id,
            Subject = 'Example 2'
        );
        caseList.add(case2);
        insert caseList;
    }

    @isTest
    public static void testInvocableMethod(){
        List<Account> acctList = new List<Account>([SELECT Id FROM Account]);

        // instantiate new invocable class and set params
        List<WhereInAction.Requests> requestList = new List<WhereInAction.Requests>();
        WhereInAction.Requests req = new WhereInAction.Requests();
        req.lookupReference = 'AccountId';
        req.objectApiName = 'Case';
        req.requestCollection = acctList;
        requestList.add(req);

        Test.startTest();
        List<WhereInAction.Results> resultsList = WhereInAction.execute(requestList);
        Test.stopTest();

        System.assert(resultsList.size() == 1);
    }
}