/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class MS_CreateExternallySubmittedObject_TEST {

    static testMethod void createCaseWithValidContactTest() {
        	Test.startTest();
        	account acct  = new Account();
			acct.name = 'Marvel';
			acct.industry = 'Other';
			acct.description = 'Test account.';
			insert acct;
        
        
			contact testContact = new contact();
			testContact.email = 'camerica@marvel.com';
			testContact.accountid = acct.id;
			testContact.lastName='Temporary Patent Companion User';
			testContact.Contact_Role__c = 'Other';
			insert testContact;
			        
     	 // Create a new email for case creation
   			Messaging.InboundEmail caseEmail = new Messaging.InboundEmail();
   			Messaging.InboundEnvelope testEnvelope = new Messaging.InboundEnvelope();
			testEnvelope.toAddress = 'createexternallysubmittedobject@7-pnqcto2t09p7y418ej6l9d3uri9el8t7841uuu19ub9hjs2qv.w-76w5lmau.cs13.apex.sandbox.salesforce.com';
		    testEnvelope.fromAddress = 'user@acme.com';
    		caseEmail.subject = 'Please contact me';
    		caseEmail.fromName = 'Test From Name';
    		caseEmail.plainTextBody = '<emailAddress>camerica@marvel.com</emailAddress><objectType>case</objectType><userContent>This is the body of a case - adding stuff in here\' that would need e\'scaped</test></userContent> <product>Patent Companion</product>';
    		createExternallySubmittedObject mailer = new createExternallySubmittedObject(); 
    		
            Messaging.InboundEmailResult result = mailer.handleInboundEmail(caseEmail, testEnvelope);
            test.stopTest();
            System.assertEquals (result.success, True);
        
        
    }
    
     static testMethod void createCaseWithNoValidContactTest() {
        	
        	account acct  = new Account();
			acct.name = 'Marvel';
			acct.industry = 'Other';
			acct.description = 'Test account.';
			insert acct;
        
        
			contact testContact = new contact();
			testContact.email = 'camerica@marvel.com';
			testContact.accountid = acct.id;
			testContact.lastName='Temporary Patent Companion User';
			testContact.Contact_Role__c = 'Other';
			insert testContact;
			        
     	 // Create a new email for case creation
   			Messaging.InboundEmail caseEmail = new Messaging.InboundEmail();
   			Messaging.InboundEnvelope testEnvelope = new Messaging.InboundEnvelope();
			testEnvelope.toAddress = 'createexternallysubmittedobject@7-pnqcto2t09p7y418ej6l9d3uri9el8t7841uuu19ub9hjs2qv.w-76w5lmau.cs13.apex.sandbox.salesforce.com';
		    testEnvelope.fromAddress = 'user@acme.com';
    		caseEmail.subject = 'Please contact me';
    		caseEmail.fromName = 'Test From Name';
    		caseEmail.plainTextBody = '<emailAddress>hawkeye@marvel.com</emailAddress><objectType>case</objectType><userContent>This is the body of a case - adding stuff in here\' that would need e\'scaped</test></userContent> <product>Patent Companion</product>';
    		createExternallySubmittedObject mailer = new createExternallySubmittedObject(); 
    		Test.startTest();
            Messaging.InboundEmailResult result = mailer.handleInboundEmail(caseEmail, testEnvelope);
            test.stopTest();
            System.assertEquals (result.success, True);
        
        
    }
    
    
    static testMethod void createBadCaseTest() {
    
    // Create a new email for case creation
   			Messaging.InboundEmail badCaseEmail = new Messaging.InboundEmail();
   			Messaging.InboundEnvelope testEnvelope = new Messaging.InboundEnvelope();
			testEnvelope.toAddress = 'createexternallysubmittedobject@7-pnqcto2t09p7y418ej6l9d3uri9el8t7841uuu19ub9hjs2qv.w-76w5lmau.cs13.apex.sandbox.salesforce.com';
		    testEnvelope.fromAddress = 'user@acme.com';
    		badCaseEmail.subject = 'Please contact me';
    		badCaseEmail.fromName = 'Test From Name';
    		badCaseEmail.plainTextBody = '<emailAddress>camerica@marvel.com</emailAddress><userContent>This is the body of a case - adding stuff in here\' that would need e\'scaped</test></userContent> <product>Patent Companion</product>';
    		createExternallySubmittedObject mailer = new createExternallySubmittedObject(); 
    		Test.startTest();
            Messaging.InboundEmailResult result = mailer.handleInboundEmail(badCaseEmail, testEnvelope);
            test.stopTest();
            System.assertEquals (result.success, True);
        
        
    }
    
    
    
    static testMethod void createERTest() {
    	
    	   
        	account acct  = new Account();
			acct.name = 'Marvel';
			acct.industry = 'Other';
			acct.description = 'Test account.';
			insert acct;
        
        
			contact testContact = new contact();
			testContact.email = 'camerica@marvel.com';
			testContact.accountid = acct.id;
			testContact.lastName='Temporary Patent Companion User';
			testContact.Contact_Role__c = 'Other';
			insert testContact;
    	
    	
    		Messaging.InboundEmail EREmail = new Messaging.InboundEmail();
   			Messaging.InboundEnvelope testEnvelope = new Messaging.InboundEnvelope();
			testEnvelope.toAddress = 'createexternallysubmittedobject@7-pnqcto2t09p7y418ej6l9d3uri9el8t7841uuu19ub9hjs2qv.w-76w5lmau.cs13.apex.sandbox.salesforce.com';
		    testEnvelope.fromAddress = 'user@acme.com';
    		EREmail.subject = 'Please contact me';
    		EREmail.fromName = 'Test From Name';
    		EREmail.plainTextBody = '<emailAddress>camerica@marvel.com</emailAddress><objectType>ER</objectType><userContent>This is the body of an ER</userContent> <product>Patent Companion</product>';
    		createExternallySubmittedObject mailer = new createExternallySubmittedObject(); 
    		 Test.startTest();
            Messaging.InboundEmailResult result = mailer.handleInboundEmail(EREmail, testEnvelope);
            test.stopTest();
            System.assertEquals (result.success, True);
    	
    	
    }
    
}