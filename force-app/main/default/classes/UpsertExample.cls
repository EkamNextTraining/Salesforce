public class UpsertExample {
    
    public static void upsertAccount(){
        
        Account acc = new Account();
        
        acc.Name = 'Salesforce Record';
        
        upsert acc;
        
        System.debug('upsert done');
    }

}