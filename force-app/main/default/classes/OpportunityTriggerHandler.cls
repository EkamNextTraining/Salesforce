public class OpportunityTriggerHandler {
	//Update Account field Total_Closed_Won_Amount__c with the sum of all Closed Won Opportunities 
	//whenever Opportunities are inserted, updated, deleted, or undeleted.
    public static void oppAmount(List<Opportunity> newOpp,Map<Id, Opportunity> oldOppMap) {
        Set<Id> accIds = new Set<Id>();
        for(Opportunity opp : newOpp){
        	if(!oldOppMap.containskey(opp.Id) && opp.AccountId != null && opp.Amount != null ){
            	accIds.add(opp.AccountId);
            } else if(oldOppMap.containskey(opp.Id) && opp.AccountId != null && opp.Amount != oldOppMap.get(opp.Id).Amount){
                accIds.add(opp.AccountId);
            }
        }

        if(accIds.isEmpty()){ 
            return;
        }
		List<Account> accountsToUpdate = new List<Account>();
        for(AggregateResult ar : [SELECT AccountId accId, SUM(Amount) totalAmt FROM Opportunity WHERE StageName = 'Closed Won' 
                                  AND AccountId IN :accIds GROUP BY AccountId ]){
        	accountsToUpdate.add(new Account(Id = (Id)ar.get('accId'),AnnualRevenue=(Decimal)ar.get('totalAmt')));
        }
		if(!accountsToUpdate.isEmpty()){ 
        	update accountsToUpdate;
        }
    }
    
    //Only one Contact per Account can have Primary_Contact__c = true. 
    //If another Contact is marked primary, remove the flag from the previous one.
    public static void method2(List<Contact> newCons) {
        Map<Id, Contact> accConMap = new Map<Id, Contact>();
		for(Contact con : newCons){
            if(con.Primary_Contact__c && con.AccountId != null){
                accConMap.put(con.AccountId,con);
            }
        }
        List<Contact> contactsToUpdate = [SELECT Id,AccountId,Primary_Contact__c FROM Contact WHERE AccountId IN :accConMap.keySet() 
                                          AND Primary_Contact__c = true];

        for(Contact existingCon : contactsToUpdate){
            Contact newPrimary = accConMap.get(existingCon.AccountId);
            if(newPrimary != null && existingCon.Id != newPrimary.Id){
                existingCon.Primary_Contact__c = false;
            }
        }

        if(!contactsToUpdate.isEmpty()){
            update contactsToUpdate;
        }
    }
}