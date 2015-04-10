/* Email services are automated processes that use Apex classes
 * to process the contents, headers, and attachments of inbound
 * email.
 */
global class MS_CloudServiceActions_v2 implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope)
     {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();

       // Set up working variables 
String firstName = '';
String lastName = '';
String action = '';
String accountName = '';
String userEmail='';
String product = '';
String SFAccountID = '';
String emailBody = email.plainTextBody;
string emailDomain = '';
string domainBody = '';
string leadSource = '';
string emailOptOut = '';
string MSSecureContactID = '';
String MSSubscriptionID = '';
String ContractType = '';
String userPhone = '';
String billingAmount = '0';
String subscriptionExpirationDate = '';
String userCount = '0';
String promoCode = '';
String year1Billing = '';
String year2Billing = '';
String year3Billing = '';
String year4Billing = '';
String downloadFileName = '';
String downloadDateTime = '';


	//Try to parse the email for all the data parts we need
			
			try
	  		{
	  		downloadFileName = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<downloadFileName>')+18,email.plainTextBody.indexOfIgnoreCase('</downloadFileName>')).trim();
	  		system.debug('downloadFileName=' + downloadFileName);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing downloadFileName');}
	  		try
	  		{
	  		downloadDateTime = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<downloadDateTime>')+18,email.plainTextBody.indexOfIgnoreCase('</downloadDateTime>')).trim();
	  		system.debug('downloadDateTime=' + downloadDateTime);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing downloadDateTime');}
			
			try
	  		{
	  		year1Billing = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<year1Billing>')+14,email.plainTextBody.indexOfIgnoreCase('</year1Billing>')).trim();
	  		system.debug('year1Billing=' + year1Billing);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing year1Billing');}try
	  		{
	  		year2Billing = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<year2Billing>')+14,email.plainTextBody.indexOfIgnoreCase('</year2Billing>')).trim();
	  		system.debug('year2Billing=' + year2Billing);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing year2Billing');}try
	  		{
	  		year3Billing = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<year3Billing>')+14,email.plainTextBody.indexOfIgnoreCase('</year3Billing>')).trim();
	  		system.debug('year3Billing=' + year3Billing);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing year3Billing');}try
	  		{
	  		year4Billing = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<year4Billing>')+14,email.plainTextBody.indexOfIgnoreCase('</year4Billing>')).trim();
	  		system.debug('year4Billing=' + year4Billing);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing year4Billing');}
	  		try
	  		{
	  		userEmail = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<emailAddress>')+14,email.plainTextBody.indexOfIgnoreCase('</emailAddress>')).trim();
	  		system.debug('userEmail=' + userEmail);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing userEmail');}
	  		try
	  		{
	  		promoCode = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<promoCode>')+11,email.plainTextBody.indexOfIgnoreCase('</promoCode>')).trim();
	  		system.debug('promoCode=' + promoCode);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing userEmail');}
	  		try
	  		{
	  		userPhone = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<userPhone>')+11,email.plainTextBody.indexOfIgnoreCase('</userPhone>')).trim();
	  		system.debug('userPhone=' + userPhone);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing userPhone');}
	  		
	  		try
	  		{
	  		billingAmount = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<amount>')+8,email.plainTextBody.indexOfIgnoreCase('</amount>')).trim();
	  		system.debug(billingAmount);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing billingAmount');}
	  		try
	  		{
	  			
	  		action = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<action>')+8,email.plainTextBody.indexOfIgnoreCase('</action>')).trim();
	  		system.debug('action=' + action);
	  		
	  	
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing action');}	  		
			try
			{
	  		product = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<product>')+9,email.plainTextBody.indexOfIgnoreCase('</product>')).trim();
      		system.debug('product=' + product);
      		}
	  		catch (exception e)
	  		{system.debug('exception parsing product');}	  		
			try
			{
      		accountName = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<accountName>')+13,email.plainTextBody.indexOfIgnoreCase('</accountName>')).trim();
	  		system.debug('accountName=' + accountName);
			}
	  		catch (exception e)
	  		{system.debug('exception parsing accountName');}	  		
			try
			{
			firstName = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<firstName>')+11,email.plainTextBody.indexOfIgnoreCase('</firstName>')).trim();
	  		system.debug('firstName=' + firstName);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing firstName');}	  		
			try
			{
	  		lastName = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<lastName>')+10,email.plainTextBody.indexOfIgnoreCase('</lastName>')).trim();
	  		system.debug('lastName=' + lastName);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing lastName');}	  		
				  		
			try
			{
	  		leadSource = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<leadSource>')+12,email.plainTextBody.indexOfIgnoreCase('</leadSource>')).trim();
	  		system.debug('leadSource=' + leadSource);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing leadSource');}	  		
			try
			{
	  		emailOptOut = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<emailOptOut>')+13,email.plainTextBody.indexOfIgnoreCase('</emailOptOut>')).trim();
	  		system.debug('emailOptOut=' + emailOptOut);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing emailOptOut');}	  		
			try
			{
	  		MSSecureContactID = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<MSSecureContactID>')+19,email.plainTextBody.indexOfIgnoreCase('</MSSecureContactID>')).trim();
	  		system.debug('MSSecureContactID=' + MSSecureContactID);
			}
			catch (exception e)
			{system.debug('exception parsing MSSecureContactID');}
	  		try
	  		{
	  		emailDomain = '%' + userEmail.substring(useremail.indexOf('@')) + '%';
			}
	  		catch (exception e)
	  		{system.debug('exception parsing emailDomain');}	  		
			try
			{
			domainBody = emailDomain.substring(2,(emailDomain.length()-5));
			system.debug('domainBody=' + domainBody);	
			}
			catch (exception e)
			{system.debug('exception parsing domainBody');}	
			try
			{
			SFAccountID = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<SFAccountID>')+13,email.plainTextBody.indexOfIgnoreCase('</SFAccountID>')).trim();
	  		system.debug('SFAccountID=' + SFAccountID);			  			  		
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing SFAccountID');}	  		
			try
			{
	  		MSSubscriptionID = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<MSSubscriptionID>')+18,email.plainTextBody.indexOfIgnoreCase('</MSSubscriptionID>')).trim();
	  		system.debug('MSSubscriptionID=' + MSSubscriptionID);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing MSSubscriptionID');}	  		
			try
			{
	  		ContractType = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<contractType>')+14,email.plainTextBody.indexOfIgnoreCase('</contractType>'));
	  		system.debug('ContractType=' + ContractType);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing ContractType');}	  		
			try
			{
	  		subscriptionExpirationDate = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<subscriptionExpirationDate>')+28,email.plainTextBody.indexOfIgnoreCase('</subscriptionExpirationDate>'));
	  		system.debug('subscriptionExpirationDate=' + subscriptionExpirationDate);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing subscriptionExpirationDate');}	
			try
			{
	  		userCount = email.plainTextBody.substring(email.plainTextBody.indexOfIgnoreCase('<userCount>')+11,email.plainTextBody.indexOfIgnoreCase('</userCount>'));
	  		system.debug('userCount=' + userCount);
	  		}
	  		catch (exception e)
	  		{system.debug('exception parsing userCount');}	
		
		if (action == 'ADDDOWNLOADRECORD')
		{
			addDownloadRecord(downloadFileName, downloadDateTime, userEmail, MSSecureContactID, emailDomain,  domainBody,  leadSource);
			result.success = true;
			return result;
		}
		
    
 //Check to see if the action is "CANCEL" - if so, call cancel function.
 		if (action == 'CANCEL')
 		{
 		cancelContracts(MSSubscriptionID);
 		result.success = true;
 		return result;
 		}
 		
    
    
 //Check to see if the action is "UPDATECONTACT" - if so, call update function.
		if (action == 'UPDATECONTACT')
		{
				changeContactDetails(MSSecureContactID, firstName,lastName, userEmail, accountName, emailOptOut, userPhone);
				result.success = true;
				return result;		
		}   
    
    
//Check to see if the action is "REGISTER" - if so, create the initial contact.
		if (action=='REGISTER')
		{
			
				createContact(MSSecureContactID,userEmail,emailDomain,domainBody,leadSource);
				result.success = true;
				return result;
		}
		
//Check to see if the action is "CREATECONTRACT" and the  contractType is "GROUP" - if so, call associate funciton and exit.
		if (action=='CREATECONTRACT' && contractType == 'GROUP')
		{
			connectUserToFirmContract(MSSubscriptionID,MSSecureContactID);
			result.success = true;
			return result;
		}
		
		
 //Check to see if the action is "CREATECONTRACT" and the type is NOT "GROUP"

 system.debug('checking to see if we should create a contract - type=' + contractType);
 		if (action == 'CREATECONTRACT' && (contractType == 'EVAL' || contractType =='INDIVIDUAL' || contractType =='RENEW'))
 		{
			createContract(ContractType,MSSecureContactID, SFAccountID, MSSubscriptionID, product, billingAmount,subscriptionExpirationDate,userCount,promoCode,year1Billing,year2Billing,year3Billing,year4Billing);
			result.success = true;
			return result;
 		}
 		
 		
 //Check to see if the action is "CREATEGROUPCONTRACT" - if so, create firm contract
 			if (action == 'CREATEGROUPCONTRACT')
 			{
 			createContract(ContractType,MSSecureContactID, SFAccountID, MSSubscriptionID, product, billingAmount,subscriptionExpirationDate,userCount,promoCode,year1Billing,year2Billing,year3Billing,year4Billing);
 			result.success = true;
			return result;
 			}
 
 	//Generic return
  	result.success = true;
	return result;
    }
    
    public static void handleErrorAndSendEmail(String errorType, String emailBody) 
				{
						Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
						String[] toAddresses = new String[] {'support@microsystems.com'};
						mail.setToAddresses(toAddresses);
						mail.setReplyTo('support@microsystems.com');
						mail.setSenderDisplayName('Salesforce Automation Agent');
						mail.setSubject('Error creating web submitted item:    ' + errorType);
						mail.setPlainTextBody('Check to see if this object was created successfully. Submitted data:     ' + emailBody);
						mail.setHtmlBody('Check to see if this object was created successfully. <br> <br>  Submitted data:   <br><br>' + emailBody);
						Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
				}    
				
	public static void sendNotificationEmail (String message, String [] TOrecipients, String [] CCrecipients)
				{
						Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
						//String[] toAddresses = new String[] {recipients};
						mail.setToAddresses(TOrecipients);
						mail.setCcAddresses(CCrecipients);
						mail.setReplyTo('support@microsystems.com');
						mail.setSenderDisplayName('Salesforce Automation Agent');
						mail.setSubject('Salesforce notice:  Action needed');
						mail.setPlainTextBody(message);
						mail.setHtmlBody(message);
						Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
				}
    
    public static void changeContactDetails(String MSSecureContactID, String firstName, String lastName, String emailAddress, String accountName, string emailOptOut, string userPhone)
				{
				String accountId ='';
				String origAccountName = '';
				String emailDomain = '%' + emailAddress.substring(emailAddress.indexOf('@')) + '%';
				String domainBody = emailDomain.substring(2,(emailDomain.length()-5));
				String leadSource= 'Secure Online Portal';
				try
				{
					Contact [] updateContact = [Select AccountId, Id, account.Name  From Contact Where MSSecureContactID__c = :MSSecureContactID];
					
					if (updateContact.size() == 0 || updateContact.size() == null )
					{
						system.debug('no contact found to update, need to call createContact');
						createContact(MSSecureContactID,emailAddress,emailDomain,domainBody,leadSource);
						updateContact = [Select AccountId, Id, account.Name  From Contact Where MSSecureContactID__c = :MSSecureContactID];
					}
					
					Account unknownEmploymentAccount = [select id from account where name = 'Employment Unknown'];
					system.debug('unknownEmploymentAccountID = ' + unknownEmploymentAccount.id);				
						accountId = updatecontact[0].AccountId;
						origAccountName = updateContact[0].account.name;
							
						Integer originalAccountNameCanBeUpdated = origAccountName.indexOfIgnoreCase('(via online submission-please verify)');
						system.debug('originalAccountNameCanBeUpdated=');
						system.debug('starting to check fields for values');
						if (emailAddress != '')
						{
						system.debug('emailAddress is not null');	
						updateContact[0].email = emailAddress;	
						}
						if (firstName != '')
						system.debug('firstName is not null');
						{
						updateContact[0].FirstName = firstName;	
						}
						if (lastName != '')
						system.debug('lastName is not null');
						{
						updateContact[0].LastName = lastName;	
						}
						if (emailOptOut == 'True')
						system.debug('emailOptOut is not null');
						{
							updateContact[0].HasOptedOutOfEmail = True;
						}
						if (userPhone != '')
						system.debug('userPhone is not null');
						{
						updatecontact[0].Phone = userPhone;
						}
					system.debug('getting ready to call the update on the updateContact object');
					update updateContact;
					system.debug('just called update on updatecontactonject');
					if (accountName != '')
					{
					system.debug('accountName variable was null');	
						if (accountID != unknownEmploymentAccount.id && originalAccountNameCanBeUpdated != -1) 
						
						{
							system.debug('accountID was not unknownemploymentaccoutn and orig not -1');
							system.debug('account name passed, contact not currently connected to Employment Unknown account.  Will update name.');
							account updateAccount = [select id from Account where id = :accountId];	
							updateAccount.name = accountName + ' (via online submission-please verify)';
							update updateAccount;
						
						} else if (accountID == unknownEmploymentAccount.id)
						{
							system.debug('Account was previously connected to Employment Unknown account - now creating new acccount');
							account acct  = new Account();
					        acct.name = accountName + ' (via online submission-please verify)';
					        acct.industry = 'Other';
					        acct.description = 'Account automatically created via online secure contact registration.';
					        insert acct;
					        accountId = acct.id;
					        
					        updateContact[0].accountid = accountId;
					        update updateContact;
							
						}
								
					
								
					}
				}
				catch (exception e)
				{
						handleErrorAndSendEmail('Error changing contact details for GUID ' + MSSecureContactID,e.getmessage());	
				
				}
			}
    
    public static void createContact(String MSSecureContactID, String emailAddress, String emailDomain, String domainBody, String leadSource)
    		{
    			String emailDomainBlackList = 'mailinator.com,trashmail.net,trbvm.com,gmail.com,yahoo.com,msn.com,outlook.com,me.com,icloud.com,hotmail.com,aol.com,hushmail.com,lycos.com,mail.com,rackspace.net,live.com,earthlink.net';
    			system.debug('MSSecureContactID for create contact =' + MSSecureContactID);
    			String accountID = '';
    			Integer domainInBlacklist = emailDomainBlackList.indexOfIgnoreCase(domainBody);	
    			String leadOwner = '';
				String leadOwnerEmail = '';
				String leadId = '';
				String leadOwnerID = '';
				String contactAndLeadBothExistMessage = 'An attempt was made to automatically convert a lead into a contact.<br>This failed due to a duplicate contact already existing in the system.<br>The lead below needs to be manually converted, selecting to merge into the existing contact.<br>' + URL.getSalesforceBaseUrl().toExternalForm() + '/';
				
				String [] contactAndLeadBothExistTORecipients = new List<String>();
				String [] contactAndLeadBothExistCCRecipients = new List<String>();
				
    			//First, check to see if there is an existing lead with this email address.
    			//If there is, get the lead ID, convert it to a contact / account and then update it.
    			
    			try 
    			{
    				Lead [] leadArray = [Select id, name, company, email, ownerID From Lead Where Email = :emailAddress Limit 1];
    				if (leadArray.size() > 0) 
									{
										system.debug('got existing lead.  Will also ensure there is not an existing contact with matching email address.');
										
										//Get owner and lead ID and set conversion date
										system.debug('Trying to set lead fields for later use');
										leadOwner = leadArray[0].ownerid;
										leadOwnerId = leadArray[0].ownerid;
										leadId = leadArray[0].Id;
										contactAndLeadBothExistMessage = contactAndLeadBothExistMessage + leadId;
										
										
										//Get user details, so we can email the lead owner and their manager
												user [] leadOwnerUser = [select name, email, manager.email from user where id = :leadOwner];
													if (leadOwnerUser.size() > 0)
														{
															leadOwner = leadOwnerUser[0].name;
															leadOwnerEmail = leadOwnerUser[0].email;
															contactAndLeadBothExistTORecipients.add(leadOwnerEmail);
															contactAndLeadBothExistCCRecipients.add(leadOwnerUser[0].manager.email);
															
														}
											
										//Check to see if there is an existing contact with this email address.
										//If there is the lead can't convert, because it will fail a duplicate constraint
										//The sales rep will need to convert the lead manually.
										//Send an email to the rep and their manager, and skip converting the lead.
										
												contact [] leadContactCheck = [select id from contact where email = :emailAddress limit 1];
													
													if (leadContactCheck.size() > 0)
													{
														sendNotificationEmail(contactAndLeadBothExistMessage,contactAndLeadBothExistTORecipients,contactAndLeadBothExistCCRecipients);
													} else
													
												  {
													
													
																//Now, try to convert the lead to a contact.
																system.debug('Trying to convert lead to a contact');
																Database.LeadConvert lc = new Database.LeadConvert();
																lc.setLeadId(leadArray[0].id);
																lc.setDoNotCreateOpportunity(true);
																
																LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
																lc.setConvertedStatus(convertStatus.MasterLabel);
																
																Database.LeadConvertResult lcr = Database.convertLead(lc);
																if(lcr.isSuccess())
																{
																
																accountId = lcr.getAccountId();
																								
																}
													}
									}
    			}
    			
    			catch (exception e)
    			{
    				handleErrorAndSendEmail('Unable to query for or create Lead for contact ',emailAddress);
    			}
    			
    			
    			try
    			
    			
    			{
    				if (accountID == '')
    				{
    				
    					Contact [] accountArray = [Select accountId From contact Where Email like :emailDomain  Limit 1];

								
							
									if (accountArray.size() > 0 && domainInBlackList == -1) 
									{
										system.debug('got existing account');
										accountId = accountArray[0].accountId;
										
									} 
									else if ((accountArray.size() == 0 | accountArray.size() == null) && domainInBlackList == -1) 
									{
										system.debug('unable to find account - creating new one');
										account acct  = new Account();
					               		acct.name = domainBody + ' (via online submission-please verify)';
					               		acct.industry = 'Other';
					               		acct.description = 'Account automatically created via online secure contact registration.';
					               		insert acct;
					               		accountId = acct.id;
									} else if (domainInBlackList != -1)
									{
										
										try
										{
											account employmentUnknownAccount = [select id from account where name = 'Employment Unknown'];
											accountId = employmentUnknownAccount.id;
										}
										catch (exception e)
										{
											handleErrorAndSendEmail('Unable to find / query for employment unknown  Account.',emailDomain);
										}
										
																			
									}
    				}
				}
		
				catch (exception e)
				{
						handleErrorAndSendEmail('Unable to query for or create Account.',emailDomain);

				}
    	
    		
			// Look up the contact by email address.  If it does not exist, create a new contact.	
			
			try 
				{
				
							
				
					
					system.debug('looking for contacts');
	       			Contact [] contactArray = [Select Id, Name, Email From Contact Where email = :emailAddress Limit 1];

						//If we got a contact from the above query by email, use it.
		  				if (contactArray.size() > 0) 
  						{		
  							system.debug('Found a contact by the passed in email address');
			             	//Update contact with the MSSecureContactID
			             	contactArray[0].MSSecureContactID__c = MSSecureContactID;
			             	contactArray[0].SecureRegistrationDate__c = date.today();
			             	
			             	if (leadOwner != '')
			             	{
			             	contactArray[0].original_lead_owner__c = leadOwner;
			             	contactArray[0].original_lead_conversion_date__c = date.today();
			             	}
			             		if (leadId != '')
			             	{
			             	contactArray[0].original_lead_id__c = leadId;
			             	}
			             		
			             	if (leadOwnerId != '')
			             	{
			             		contactArray[0].original_lead_owner_user__c = leadOwnerId;
			             	}
			             	
			             	
			             	
			             	update contactArray[0];
			               	
               			}	 
		         
		         //There's no existing contact, so create one.
		        		else if (contactArray.size() == 0 | contactArray.size() == null) 
		             
			            {
		            	
			             	system.debug('no contact found, need to make one');
			             	//Didn't find a contact, so I need to create one
			             	
							Contact cnt = new Contact(); 
							system.debug('Account id=' + accountId);
			               	cnt.AccountId = accountId;
			               	cnt.Email = emailAddress;
			               	cnt.lastName='Temporary Online Portal User';
			               	cnt.Contact_Role__c = 'Other';
			               	cnt.leadSource = leadSource;
			               	system.debug('MSSecureContactID=' + MSSecureContactID);
			               	cnt.MSSecureContactID__c = MSSecureContactID;
			               	cnt.SecureRegistrationDate__c = date.today();
			             	  	if (leadOwner != '')
			             	{
			             	cnt.original_lead_owner__c = leadOwner;
			             	cnt.original_lead_conversion_date__c = date.today();
			             	}
			             		if (leadId != '')
			             	{
			             	cnt.original_lead_id__c = leadId;
			             	}
			             				             	
			               	insert cnt;
		              	}
				}
			//Throw error if the query for contact fails
			catch (System.Queryexception e)
				{
		    		handleErrorAndSendEmail('Error querying for / creating contact for GUID ' + MSSecureContactID,e.getmessage());

    			}
    			
		    }
		    
	public static void createContract(String ContractType,String MSSecureContactID, String SFAccountID, String MSSubscriptionID, String product,  String billingAmount, String subscriptionExpirationDate, String userCount,String promoCode,String year1billing,String year2billing,String year3billing,String year4billing)
		    {
		    	String accountId = '';
		    	String contactId = '';
		    	String accountNameFromID ='';
		    	String firstName = '';
		    	String lastName = '';
		    	Decimal origBillingAmount = 0;
		    	String period = ' month ';
		    	Date subscriptionExpirationDateAsDate = Date.parse(subscriptionExpirationDate);
		    	Integer userCountInt = integer.valueOf(userCount);
		    	if (userCountInt == 0 || userCountInt == null){
		    		userCountInt = 1;
		    	}
		    	Integer year1billingInt = 0;
		    	Integer year2billingInt = 0;
		    	Integer year3billingInt = 0;
		    	Integer year4billingInt = 0;
		    	
		    	if (year1billing  != '') year1billingInt = integer.valueOf(year1billing); 
		    	if (year2billing  != '') year2billingInt = integer.valueOf(year2billing);
		    	if (year3billing  != '') year3billingInt = integer.valueOf(year3billing);
		    	if (year4billing  != '') year4billingInt = integer.valueOf(year4billing);
		    	if (product == 'PATENT'){
		    		product ='Patent Companion';
		    	}
		    	
		    	string contractLength = String.valueOf(date.today().monthsBetween(subscriptionExpirationDateAsDate));
	//Set period variable to either month or day, based on term
		system.debug('contractlength months between=' + contractLength);
		if (contractLength == '0'){
			period = ' day ';
			} 	
		
		
			
	//Try to get the SF Contact from the passed in MSSecureContactID
		    if (MSSecureContactID != '')
		    {
		    
				    try		
				    	{	
				    	Contact [] contactArray = [Select Id, firstname, lastname, AccountId, Account.Name, Name, Email From Contact Where MSSecureContactID__c = :MSSecureContactID Limit 1];
		
						if (contactArray.size() > 0) 
		  				
		  				
		  					{
		  							contactID = contactArray[0].id;
		  							accountId = contactArray[0].AccountId;
		  							accountNameFromID = contactArray[0].Account.Name;
		  							firstName = contactArray[0].FirstName;
		  							lastName = contactArray[0].LastName;
		  							
		               		}
				    	
				    	}
				    	catch (exception e)
				    	{
				    		handleErrorAndSendEmail('Unable to query for Contact.',MSSecureContactID);
									return;
				    	}
		    }	    	
	//Try to get the SF Account from the passed in SFAccountID 
		    	if (SFAccountID != '')
		    	{
		    	 try 
					    {
				 			Account [] accountArray = [Select ID,name from account where AccountID__c = :SFAccountID];
								system.debug('SFAccountID=' + SFAccountID);
			
							if (accountArray.size() > 0 ) 
								{
									system.debug('got existing account');
									system.debug('accountId=' + accountID);
									
									if (product == 'EagleEye') {
									accountArray[0].EagleEye__c = True;										
									} 
									
									if (product == 'Patent Companion') {
									accountArray[0].Patent_Companion__c = True;
									}

									update accountArray[0];
									if (accountID == '')
									{
										system.debug('accountID was blank, so setting it to ' + accountArray[0].Id);
										accountId = accountArray[0].Id;
										
									}
									if (accountNameFromID == '')
									{
										accountNameFromID = accountArray[0].Name;
									}
									
								}
							
						}
					
					catch (exception e)
						{
							handleErrorAndSendEmail('Unable to query for / create Account.',SFAccountID);
							return;
						}
		    	
		    	}
		    		if (contactId == '' && SFAccountID == '')
		    		{
		    			
		    			handleErrorAndSendEmail('Contact and SFAccountID both NULL. Invalid CreateContract call.',MSSecureContactID + ' / ' + SFAccountID);
		    			return;
		    		}
		    	
		    	try
					{
					
					
					//First, try to look up an existing contract by subscription ID.  If we find it, we're just updating things.  If not, create new one.
					String updateContractId = '';
					String checkContractID = '';
					
					system.debug('getting the billingamountint');
					
					if (billingAmount == ''){
						billingAmount = '0';
					}
					
					
					decimal billingAmountInt = decimal.valueof(billingAmount);
					Contract [] checkContract = [Select ID, MSSubscriptionID__c, online_subscription_revenue_to_date__c from Contract where MSSubscriptionID__c = :MSSubscriptionID];
					system.debug('going to see if checkContract has a value.');
					if (checkContract.size() > 0)
					{
						system.debug('checkContractID has a value - existing contract');
						checkContractId = checkContract[0].id;	
					}
					
				system.debug('checkContractID = ');
					if (checkContractID <> '')
					{
						contract newContract = [select ID, MSSubscriptionID__c, online_subscription_revenue_to_date__c from Contract where id = :checkContract[0].Id];
						system.debug('Contract found.');

						origBillingAmount = newContract.online_subscription_revenue_to_date__c;
						
						if (origBillingAmount == null )
						{
							origBillingAmount = 0;
						}
						
						updateContractID = newContract.id;
					}
					
						
						else if (checkContractId == '')
					{
							system.debug('no contract found, so making a new one.');
							
							contract newContract = new contract();
							newContract.AccountId = accountID;
							newContract.StartDate = date.today();
							newContract.EndDate = subscriptionExpirationDateAsDate;
							newContract.Activation_End_Date_WF__c = subscriptionExpirationDateAsDate;
							newContract.MSSubscriptionID__c = MSSubscriptionID;
							
							if (product == 'Patent Companion') {							
							newContract.Contract_Sub_Type__c = 'Subscription';
							}
							
							newContract.Original_Contract_Date__c = date.today();
							newContract.online_subscription_revenue_original__c = billingAmountInt;
							
							if (product == 'Patent Companion') {
							newContract.product__c = 'Patent Companion';
							}
							if (product == 'EagleEye') {
							newContract.product__c = 'EagleEye';
							}
							insert newContract;
							system.debug('just made a new contract - here is the ID=' + newContract.id);
							updateContractId = newContract.id;
					}
					
							contract updateContract = [select ID, MSSubscriptionID__c, online_subscription_revenue_to_date__c from Contract where id = :updateContractId];
							
							if (ContractType == 'EVAL') 
									{
											updateContract.ContractIndividual__c = ContactId;
											updateContract.Contract_Type__c = 'Evaluation';
											updateContract.Evaluation_Start_Date__c = date.today();
											updateCOntract.Evaluation_End_Date__c = subscriptionExpirationDateAsDate;
											
											updateContract.Description = product + ' evaluation for ' + firstName + ' ' + lastName;
											updateContract.Name = firstName + ' ' + lastName + ' - ' + date.today().year() + '/' + date.today().month() + '/' + date.today().day() + ' ' + product;
											
											
											contact updateContact = [select id from contact where id = :ContactId];
											
											
											if (product == 'Patent Companion') {
										
											updateContact.Patent_Companion_Trial_Initiated__c = true;
											updateContact.Patent_companion_trial_start__c = date.today();
											updateContact.Patent_Companion_trial_end__c = subscriptionExpirationDateAsDate;
											}
											updateContract.promotion_code__c = promocode;
											update updateContact;
									}
							 else if (ContractType == 'INDIVIDUAL') 
									{
											updateContract.ContractIndividual__c = ContactId;										
											updateContract.Description = product + ' ' + contractLength  + period + 'contract for ' + firstName + ' ' + lastName;
											updateContract.Contract_Type__c = 'Agreement (Initial)';
											updateContract.Name = firstName + ' ' + lastName + ' - ' + date.today().year() + '/' + date.today().month() + '/' + date.today().day() + ' ' +  product;
											updateContract.EndDate = subscriptionExpirationDateAsDate;
											updateContract.Activation_End_Date_WF__c = subscriptionExpirationDateAsDate;
											updateContract.promotion_code__c = promocode;
											
											if (MSSecureContactID != '')
												    {
		    
													    try		
				    										{	
				    										Contact updateContact = [Select Id, firstname, lastname, AccountId, Account.Name, Name, Email From Contact Where id  = :ContactId];
				    										if (product == 'Patent Companion'){
				    										updateContact.patent_companion__c = true;
				    										}
				    										if (product == 'EagleEye'){
				    										updateContact.EagleEye__c = true;
				    										}
				    										
				    										update updateContact;
				    										}
														catch (exception e){
																			}
														}
										//ADDING CODE TO FIND THE ORIGINAL EVAL CONTRACT.  IF IT EXISTS, SET THE ORIGINAL CONTRACT FIELD ON THE NEW CONTRACT
										//TEMPORARY - PC WILL BE CHANGED TO USE THE SAME SUBSCRIPTION ID FOR EVAL AND REAL CONTRACTS
										//WHEN THAT HAPPENS, DELETE OR COMMENT OUT THIS CODE
										
				    						contract [] evalcontract = [select ID, startdate, enddate, Previous_Term_Contract__c, Previous_Contract_ID__c from Contract where accountid=:AccountId and product__c = :product and Contract_Type__c = 'Evaluation' ];
											
													
											system.debug('going to see if checkContract has a value.');
											if (evalcontract.size() > 0)
											{
											system.debug('evalcontract has a value - existing contract');
											updateContract.Previous_Contract_ID__c = evalcontract[0].previous_contract_id__c;
											updateContract.Previous_Term_Contract__c = evalcontract[0].Previous_term_contract__c;
											updateContract.Evaluation_Start_Date__c = evalcontract[0].startdate;
											updateContract.Evaluation_End_Date__c = evalcontract[0].enddate;
											}	
										//END CODE TO FIND THE EVAL CONTRACT
												    
									} 
							 else if (ContractType == 'RENEW') 
									{
											updateContract.EndDate = subscriptionExpirationDateAsDate;
											
											updateContract.Activation_End_Date_WF__c = subscriptionExpirationDateAsDate;
											
											updateContract.ContractIndividual__c = ContactId;
											updateContract.Name = firstName + ' ' + lastName + ' - ' + date.today().year() + '/' + date.today().month() + '/' + date.today().day() +  ' ' + product;
											updateContract.Description = product + ' ' + contractLength + period + 'renewal for ' + firstName + ' ' + lastName;
											//updateContract.online_subscription_revenue_to_date__c = origBillingAmount + billingAmountInt;
											updateContract.Contract_Type__c = 'Renewal';
											updateContract.promotion_code__c = promocode;
									}
							else if (ContractType == 'GROUP')
									{
											updateContract.Name = accountNameFromID + ' - ' + date.today().year() + '/' + date.today().month() + '/' + date.today().day() +  ' ' + product;
											updateContract.Description = product + ' ' + contractLength + period + 'contract for ' + accountNameFromID;
											updateContract.Contract_Type__c = 'Agreement (Initial)';
											system.debug('what kind of contract is this/' + product);
											
											if (product == 'Patent Companion'){
												system.debug('This is a patent contract');
												system.debug(year1billingInt);
											updateContract.patent_companion_users__c = userCountInt;
											updatecontract.year_1_billing_amount_patent_companion__c = year1billingInt;
											updatecontract.year_2_billing_amount_patent_companion__c = year2billingInt;
											updatecontract.year_3_billing_amount_patent_companion__c = year3billingInt;
											updatecontract.year_4_billing_amount_patent_companion__c = year4billingInt;	
											}
											if (product == 'EagleEye') {
												system.debug('This is an EE contract');
											updateContract.EagleEye_users__c = userCountInt;
											updatecontract.year_1_billing_amount_EagleEye__c = year1billingInt;
											updatecontract.year_2_billing_amount_EagleEye__c = year2billingInt;
											updatecontract.year_3_billing_amount_EagleEye__c = year3billingInt;
											updatecontract.year_4_billing_amount_EagleEye__c = year4billingInt;
											}
											
									}
							
							updateContract.Contract_Term_Length_Yrs__c = 0;
							updateContract.Contract_Sub_Type__c = 'Subscription';
							system.debug('billingamountint=');
							system.debug(billingAmountInt);
							system.debug('origBillingAmount=');
							system.debug(origBillingAmount);
							updateContract.online_subscription_revenue_to_date__c = billingAmountInt + origBillingAmount;
							updateContract.online_subscription_revenue_current_term__c = billingAmountInt;
							
									if (year1billingInt == 0 && billingAmountInt > 0 && product == 'Patent Companion')
										{
										updateContract.year_1_billing_amount_patent_companion__c = billingAmountInt;
										}
								update updateContract;
						
							
							contract_product__c [] checkCP = [select Product__c from contract_product__c where contract__c = :updateContract.id];
							system.debug('just checked to see if there was an existing contract product');
							if (checkCP.size() == 0 | checkCP.size() == null)
							{
							system.debug('there was no existing contract product.');
							//Create the eval contract's contract product			
							RecordType rt = [select Id from RecordType where Name = 'User Licenses' and SobjectType = 'Contract_Product__c' limit 1];
							system.debug('recordtrype=' + rt.id);
							
							contract_product__c newCP = new contract_product__c();
							newCP.Contract__c = updateContract.id;
							system.debug('newCP contract = '+updatecontract.id);
							
							if (product == 'Patent Companion'){
							newCP.Product__c = 'Patent Companion';
							system.debug('product = patent companion');	
							}
							
							if (product == 'EagleEye'){
							newCP.Product__c = 'EagleEye';
							}
							
							newCP.RecordTypeID = rt.id;
							system.debug('inserting the cp now!');
							insert newCP;
							
							}
								updateContract.Status = 'ACTIVE';
								system.debug('updateContractName=' + updateContract.name);
								update updateContract;
							
							
							
							
							
							}	
						catch (exception e)	
						{
						handleErrorAndSendEmail('Error creating contract', e.getmessage());
						
						}
						
		    	
		   
		   
		   
		    }
		    
	public static void connectUserToFirmContract(String MSSubscriptionID, String MSSecureContactID)
			{
			String contractId = '';
			String accountId = '';
			String contactId = '';
				try
					{
					
				
					Contact [] contactArray = [select id from contact where MSSecureContactID__c = :MSSecureContactID];
						if (contactArray.size() > 0)
						{
							contactId = contactArray[0].Id;
						}
				
				
					Contract [] contractArray = [Select id from Contract where MSSubscriptionID__c = : MSSubscriptionID];
				
						if (contractArray.size() == 0 || contractArray.size() == null)
	  						{
	  							handleErrorAndSendEmail('No Contracts found for subscriptionID ' + MSSubscriptionID,MSSubscriptionID);
	  							return;
	  						}
	  						else 
	  						{
	  							contractId = contractArray[0].id;
				  						
	  						}
	  						
	  						//NEED TO add logic to this function to detect what kind of contract it is.  Either passed in or query the product field of the passed in contract.
	  						 
	  						contactArray[0].patent_contract__c = contractId;
	  						//update userContact;
	  						update contactArray[0];	
				
				
					}
				catch (QueryException e)
					{
						handleErrorAndSendEmail('Error connecting contract for user ' + contact.id,e.getmessage());	
					}
			
			}
			
			public static void cancelContracts(String MSSubscriptionID) 
			{
			
			try
			{
				
			system.debug('in the cancel function');
			
  				
  				Contract [] contractArray = [Select id from Contract where MSSubscriptionID__c = :MSSubscriptionID];
  						
  						if (contractArray.size() > 0)
  						
  						{
  							
		  						system.debug('found a contract array - now need to drop them.');
		  						for(Integer a = 0; a < contractArray.size(); a++)
			  						{
			  						system.debug('set status to dropped for contract contract #' + contractArray[a].id);
			  						contractArray[a].status = 'DROPPED';
			  						contractArray[a].Description = 'Contract dropped via customer request via Secure portal';
			  						update contractArray[a];
									}
  						}	
  				
  						
			}
			catch (exception e)
					{
						handleErrorAndSendEmail('Error cancelling contract  ' + MSSubscriptionID,e.getmessage());	
					}
			}
					    
		    public static void addDownloadRecord(String downloadFileName, String downloadDateTime, String userEmail, String MSSecureContactID,String emailDomain, String domainBody, String leadSource)
		    {
		    String DLContactID = '';
		    String DLAccountID = '';
		     system.debug(downloadDateTime);
		    Date downloadDateTimeAsDate = Date.parse(downloadDateTime);	
		   
		    system.debug(downloadDateTimeAsDate);
		    
		    try
		    {
		    	contact [] DLContact = [select id, AccountId, account.name from contact where email = :userEmail limit 1];
		    	
							
							if (DLContact.size() == 0 | DLContact.size() == null)
							{
							
							createContact(MSSecureContactID,userEmail,emailDomain,domainBody,leadSource);
							DLContact = [Select AccountId, Id, account.Name  From Contact Where MSSecureContactID__c = :MSSecureContactID];
							
							} else
							{
							DLContactID = DLContact[0].ID;
							DLAccountID = DLContact[0].Account.ID;
							}
							//Create the download record			
							
							Download__c newDownload = new Download__c();
							newDownload.Contact__c = DLContactId;
							newDownload.Account__c = DLAccountId;
							newDownload.fileDownloaded__C = downloadFileName;
							newDownload.whenDownloaded__c = downloadDateTimeAsDate;
							insert newDownload;
							
		    	
		    	
		    }	
		    	catch (exception e)
		    	{
		    		handleErrorAndSendEmail('Error creating download record',e.getmessage());
		    	}
		    	
		    }
		    
		    
}