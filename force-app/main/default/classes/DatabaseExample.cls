public class DatabaseExample {
   
    public static void insertUsingDatabase(){
        
        Account acc = new Account();
        
        acc.Name = 'Testify';
        
        Database.SaveResult Result = Database.insert(acc);
        
        if(result.isSuccess()){
            
            System.debug('Record inserted');
            
        } else{
             System.debug('Record not inserted');
            
        }
    }
    
    public static void opp(List<Opportunity> opps){
        Set<Id> accIds = new Set<Id> ();
        for(opportunity opp : opps){
            if(opp.AccountId!=null && opp.Amount!=null){
                accIds.add(opp.AccountId);
            }
        }
        List<AggregateResult> arResult = [SELECT SUM(Amount) amt, AccountId, Account.ParentId parentId FROM Opportunity WHERE Id 
                                          IN : accIds GROUP BY Account.ParentId,AccountId ];
        List<Account> accs = new List<Account>();
        for(AggregateResult ar : arResult){
            String accId  = String.valueOf(ar.get('AccountId'));
            Integer amount  = Integer.valueOf(ar.get('amt'));
            String parentAccId  = String.valueOf(ar.get('parentId'));
            
            Account acc = new Account(Id=accId, AnnualRevenue=amount);
            accs.add(acc);
            if(parentAccId!=null){
                acc = new Account(Id=parentAccId, AnnualRevenue=amount);
                accs.add(acc);
            }
        }
        update accs;
    }
}