public with sharing class CreateOppFromContract {

    Opportunity    opp;
	Contract 	   cont;
   	
   	
    public CreateOppFromContract(ApexPages.StandardController stdController) { 
        cont = (Contract)stdController.getRecord();     
       
    }

    public PageReference Create() {
        PageReference pageRef = null;
        try{
            
            
            
           
			Contract cont = [select account.name, ID,Currency_Type__c, AccountId, name, Year1_Billing_Amount_Total__c, Year2_Billing_Amount_Total__c,Year3_Billing_Amount_Total__c,Year4_Billing_Amount_Total__c,Year_4_Billng_Amount_Services__c,Year_3_Billing_Amount_Services__c,Year_2_Billing_Amount_Services__c,Year_1_Billing_Amount_Services__c,Contract_Term_Length_Yrs__c,startdate,enddate,account.industry, account.Client_Relations_Account_Owner__c,Year_1_Maintenance_Amount_3BClean__c,Year_1_Maintenance_Amount_DocXtools__c,Year_1_Maintenance_Amount_EagleEye__c,Contract_Sub_Type__c,Year_1_License_Amount_3BClean__c,Year_1_License_Amount_DocXtools__c,Year_1_License_Amount_EagleEye__c FROM Contract WHERE Id=:cont.Id];
			
			
			Decimal totalValue = 0;
			Decimal totalServices = 0;
			Decimal totalPerpSupport = 0;
			Decimal EuroConversionRate = 0;
			Decimal PoundsConversionRate=0;
			
			if (cont.Contract_Term_Length_Yrs__c == 1)  totalValue = cont.Year1_Billing_Amount_Total__c;
			if (cont.Contract_Term_Length_Yrs__c == 2)  totalValue = cont.Year2_Billing_Amount_Total__c;
			if (cont.Contract_Term_Length_Yrs__c == 3)  totalValue = cont.Year3_Billing_Amount_Total__c;
			if (cont.Contract_Term_Length_Yrs__c == 4)  totalValue = cont.Year4_Billing_Amount_Total__c;
			if (cont.Contract_Term_Length_Yrs__c == 1)  totalServices = cont.Year_1_Billing_Amount_Services__c;
			if (cont.Contract_Term_Length_Yrs__c == 2)  totalServices = cont.Year_2_Billing_Amount_Services__c;  
			if (cont.Contract_Term_Length_Yrs__c == 3)  totalServices = cont.Year_3_Billing_Amount_Services__c;
			if (cont.Contract_Term_Length_Yrs__c == 4)  totalServices = cont.Year_4_Billng_Amount_Services__c;
			
			if (totalValue == null) totalValue = 0;
			if (totalServices == null) totalServices =0;
			
			Decimal totalNewTermValue = totalValue - totalServices;
			
			CurrencyRates__c mc = CurrencyRates__c.getOrgDefaults();			
					EuroConversionRate	= mc.EuroConversionRate__c;
					PoundsConversionRate= mc.BritishPoundConversionRate__c;	
			
			if (cont.Contract_Sub_Type__c == 'Perpetual') 
				{
					if (cont.Year_1_License_Amount_3BClean__c > 0) totalPerpSupport = cont.Year_1_Maintenance_Amount_3BClean__c;
					if (cont.Year_1_License_Amount_DocXtools__c > 0) totalPerpSupport = cont.Year_1_Maintenance_Amount_DocXtools__c;
					if (cont.Year_1_License_Amount_EagleEye__c > 0) totalPerpSupport = cont.Year_1_Maintenance_Amount_EagleEye__c;
								
				}
		
		
system.debug('checking to see if the currency is euro');		
		
			if (cont.Currency_Type__c.codePointAt(0) == 8364)
				{
				 totalNewTermValue = totalNewTermValue * EuroConversionRate;
				 totalPerpSupport = totalPerpSupport  *  EuroConversionRate;
				}
				
system.debug('checking to see if the currency is pounds');			
				
				if (cont.Currency_Type__c.codePointAt(0) == 163)
				
				{
				
				totalNewTermValue = totalNewTermValue * PoundsConversionRate;
				totalPerpSupport =  totalPerpSupport *  PoundsConversionRate;
				}
				
				
				
			system.debug('rate');
			system.debug(totalNewTermValue);
						
			User  u = [select id from user where id = :cont.account.Client_Relations_Account_Owner__c];
			
			
			
						
            //Create the opportunity
            Opportunity o = new Opportunity (
            AccountID = cont.AccountId
            ,name=cont.account.name + '- Product Renewal'
            ,Opportunity_Start_Date__c = cont.enddate +1
            ,Product__c = 'Renewal'
            ,Related_Renewal_Contract__c = cont.id
            ,CloseDate = cont.enddate + 1
            ,StageName = '7-Negotiation'
            ,ownerID = u.Id
            ,amount = totalNewTermValue
            ,Software_Amount__c = totalNewTermValue
            ,Grading_Scale__c = '8-14 (solid opportunity)'
            ,Support_Amount__c = totalPerpSupport
            ,Existing_Customer__c = True
            );
            insert o;
            
           
           

           pageRef = new PageReference ('/'+o.id);
           pageRef.setRedirect(true);
           
       }catch(QueryException e){
          
           

       }catch(DMLException e){
           
           system.debug('DML query did not work');
       }

       return pageRef;
    }    
    

    
}