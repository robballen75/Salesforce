@isTest
private class CreateOppFromContractTest {
 
        
          public static testMethod void myUnitTest() 
    {
    	
   		user u = [select id from user limit 1];
					
    	 //Set up an acct to use later in the test
    	account acct  = new account();
		acct.name = 'Test Company';
		acct.Industry = 'Law Firm - UK(House)';
		acct.BillingCountry = 'France';
	    acct.Client_Relations_Account_Owner__c = u.id; 
		insert acct;
					
	
//Set up a contract to use later in the test					
		contract newCont = new contract();
		newCont.accountID = acct.id;
		newCont.name='DocXtools contract';
		newCont.status = 'Draft';
		newCont.startDate = date.today() - 360;
		newCont.endDate = date.today() + 90;
		newCont.Currency_Type__c = 'other';
	insert newCont;
	string id = newCont.Id;

    	
system.debug('just started');
test.starttest();    	

        PageReference pageRef = Page.CreateRenewalOpportunity;
        Test.setCurrentPage(pageRef);
        ApexPages.Standardcontroller sc = new ApexPages.Standardcontroller(newCont);
       CreateOppFromContract controller = new CreateOppFromContract(sc);
        ApexPages.currentPage().getParameters().put('Id',newCont.id);
       controller.create();
   
        opportunity o = [select id,Related_Renewal_Contract__c   from opportunity where Related_Renewal_Contract__c = :newCont.id];
        system.assertEquals(newCont.id, id);
		
        test.stoptest();
        
        
    }
        
        
        
    }