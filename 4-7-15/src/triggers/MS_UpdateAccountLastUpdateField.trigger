trigger MS_UpdateAccountLastUpdateField on Account (before insert, before update) {
   
  // Set flag to detect if we need to update the last updated field for a new account
    
    string currentUser = UserInfo.getUserId();
    
    
    for (integer idx = 0; idx< trigger.new.size(); idx++)
    {
    	
    
    
    if (system.trigger.isUpdate)
    {
    
    	// Compare the specified account fields (account at a glance) to see if they have changed  
    	// if so, update the last updated field date and by fields.
 		if (trigger.new[idx].Customer_Since_Date__c != trigger.old[idx].Customer_since_date__c 
    		 || trigger.new[idx].KP_Renewal_Risk__c != trigger.old[idx].KP_Renewal_Risk__c 
    		 || trigger.new[idx].Abbreviation_Checker_Deployed__c != trigger.old[idx].Abbreviation_Checker_Deployed__c
    		 || trigger.new[idx].DocXtools_Version__c    != trigger.old[idx].DocXtools_Version__c
    		 || trigger.new[idx].DocXtools_Version_Being_Deployed__c != trigger.old[idx].DocXtools_Version_Being_Deployed__c   
    		 || trigger.new[idx].DocXtools_Deployment_Status__c    != trigger.old[idx].DocXtools_Deployment_Status__c
    		 || trigger.new[idx].DocXtools_Included_on_Desktop_Image__c    != trigger.old[idx].DocXtools_Included_on_Desktop_Image__c 
    		 || trigger.new[idx].DocXtools_Deployed_Groups_NEW__c    != trigger.old[idx].DocXtools_Deployed_Groups_NEW__c 
    		 || trigger.new[idx].DocXtools_Groups_Getting_High_Value__c    != trigger.old[idx].DocXtools_Groups_Getting_High_Value__c 
    		 || trigger.new[idx].Traffic_Signal_Deployed__c    != trigger.old[idx].Traffic_Signal_Deployed__c 
    		 || trigger.new[idx].Skills_Assessment_Deployed_NEW__c    != trigger.old[idx].Skills_Assessment_Deployed_NEW__c 
    		 || trigger.new[idx].Role_based_ribbon_s_deployed__c    != trigger.old[idx].Role_based_ribbon_s_deployed__c 
    		 || trigger.new[idx].Specal_Code_DLL_for__c != trigger.old[idx].Specal_Code_DLL_for__c)
    		  {
    
    			//Update the account last updated field because one of the above was true		
    			trigger.new[idx].at_a_glance_last_updated__c = date.today();
    			trigger.new[idx].MS_AtAGlanceLastUpdatedByUser__c = currentuser;
    		 }
    		 
    		 
    	//Now, check the Account Environment fields.  If any have changed, update the appropriate
    	//last edit by and date fields.
    	 if (trigger.new[idx].Primary_Operating_Systems__c != trigger.old[idx].Primary_Operating_Systems__c 
    		 || trigger.new[idx].PrimaryWordProc__c != trigger.old[idx].PrimaryWordProc__c
    		 || trigger.new[idx].Email_System__c    != trigger.old[idx].Email_System__c 
    		 || trigger.new[idx].DMS__c    != trigger.old[idx].DMS__c
    		 || trigger.new[idx].Templates__c    != trigger.old[idx].Templates__c 
    		 || trigger.new[idx].Numbering_Tool__c    != trigger.old[idx].Numbering_Tool__c 
    		 || trigger.new[idx].MetaData_Tool__c    != trigger.old[idx].MetaData_Tool__c 
    		 || trigger.new[idx].Compare_Tool__c    != trigger.old[idx].Compare_Tool__c 
    		 || trigger.new[idx].TOA_Tool__c    != trigger.old[idx].TOA_Tool__c 
    		 || trigger.new[idx].X02007_Migration_Plan__c    != trigger.old[idx].X02007_Migration_Plan__c 
    		 || trigger.new[idx].Next_Office_Version__c    != trigger.old[idx].Next_Office_Version__c 
    		 || trigger.new[idx].Date_for_2010__c    != trigger.old[idx].Date_for_2010__c) 
    		  {
    
    				//Update the account last updated field because one of the above was true		
				    trigger.new[idx].last_updated__c = date.today();
    				trigger.new[idx].MSAccountEnvironmentLast_Updated_By__c = currentuser;
    		  }
    		 
    // If this is a new account, only fill in the last update field if one the 
    //specified account at a glance fields are not null    
    } else 
    	{
    		if (trigger.new[idx].customer_since_date__c != null
    		|| trigger.new[idx].KP_Renewal_Risk__c != null
    		|| trigger.new[idx].Abbreviation_Checker_Deployed__c != null
    		|| trigger.new[idx].DocXtools_Version__c != null
    		|| trigger.new[idx].DocXtools_Version_Being_Deployed__c != null
        	|| trigger.new[idx].DocXtools_Deployment_Status__c != '--none--'
    		|| trigger.new[idx].DocXtools_Included_on_Desktop_Image__c != 'No'
	    	|| trigger.new[idx].DocXtools_Deployed_Groups_NEW__c != null
	    	|| trigger.new[idx].DocXtools_Groups_Getting_High_Value__c != null
	    	|| trigger.new[idx].Traffic_Signal_Deployed__c != '--none--'
			|| trigger.new[idx].Skills_Assessment_Deployed_NEW__c != 'Unknown'
			|| trigger.new[idx].Role_based_ribbon_s_deployed__c != null	
    		|| trigger.new[idx].Specal_Code_DLL_for__c != null)
    			{
    				//fieldUpdated = true;
    	 			trigger.new[idx].MS_AtAGlanceLastUpdatedByUser__c = currentuser;
        			trigger.new[idx].at_a_glance_last_updated__c = date.today();
    			}
   
	 		//Check the account environment fields on new account creation.
	 		//If any of the monitored fields have been udpated, set the last 
	 		//modified by and date fields. 		
			if (trigger.new[idx].Primary_Operating_Systems__c!= null
  				|| trigger.new[idx].PrimaryWordProc__c != null
  				|| trigger.new[idx].Email_System__c != null
  				|| trigger.new[idx].DMS__c != null
 				|| trigger.new[idx].Templates__c != null
  				|| trigger.new[idx].Numbering_Tool__c != null
  				|| trigger.new[idx].MetaData_Tool__c != null
  				|| trigger.new[idx].Compare_Tool__c != null
  				|| trigger.new[idx].TOA_Tool__c != null
  				|| trigger.new[idx].X02007_Migration_Plan__c != null
  				|| trigger.new[idx].Next_Office_Version__c != null
  				|| trigger.new[idx].Date_for_2010__c != null)
    				{
	        			trigger.new[idx].MSAccountEnvironmentLast_Updated_By__c = currentuser;
        				trigger.new[idx].last_updated__c = date.today();
					}
     
     
    		} //End actions for new case    
    		      	
    } //End bulk safe loop
	}