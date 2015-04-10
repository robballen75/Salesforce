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
private class MS_Contact_Evaluate_EagleEye_Eval_Test {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
         //Set up an acct to use later in the test
        account acct2  = new account();
		acct2.name = 'Test Company2';
		acct2.Industry = 'Law Firm - UK(House)';
	
	insert acct2;
	
	contact newContact = new contact();
	newContact.FirstName = 'Test';
	newContact.LastName = 'User';
	newContact.LeadSource = 'Other';
	newContact.Contact_Role__c = 'Other';
	newContact.AccountId = acct2.Id;
	newContact.SitecoreUsername__c = 'tuser@test.local';
	newContact.Web_Primary_Contact__c = True;
	newContact.Web_Active_User__c = True;
	
	
	insert newContact;
	test.starttest();
	
	newContact.EagleEye_Eval_Requested_Picklist__c = 'Requested';
		update newContact;
		
		//Check Licence key - should show DocXtools and DocID.
	contract newContract = [select id, Contract_Type__c from contract where contract.AccountId = :acct2.id];
	system.assertEquals('Evaluation', newContract.Contract_Type__c);
	
	
    }
}