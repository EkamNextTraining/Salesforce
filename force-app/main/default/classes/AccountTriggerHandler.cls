public class AccountTriggerHandler {
    
    public static void beforeInsert(List<Account> newAccounts){
        
        for(Account acc: newAccounts){
            
            if(acc.AnnualRevenue != null && acc.AnnualRevenue > 1000000){
                
                acc.Rating = 'Hot';
            }
        }
    }
        

}