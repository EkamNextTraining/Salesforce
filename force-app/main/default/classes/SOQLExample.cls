public class SOQLExample {
    
    public static void getAccount(){
        
        List<Account> accList = [SELECT Id, Name, Industry FROM Account WHERE Industry = 'Technology'];
        
        for(Account acc : accList){
            
            System.debug('Account Name:' + acc.Name);
            System.debug('Industry:' + acc.Industry);
        }
    }

}