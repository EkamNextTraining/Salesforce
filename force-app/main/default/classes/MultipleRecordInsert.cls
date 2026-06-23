public class MultipleRecordInsert {
    
    public static void createAccount(){
        
        List<Account> accList = new List<Account>();
        
        Account acc1 = new Account(
               Name = 'Techi Solutions',
               Industry = 'Technology'
          );
        
        Account acc2 = new Account(
            Name = 'Test Record',
            Industry = 'Banking'
        );
        
        accList.add(acc1);
        accList.add(acc2);
        
        Insert accList;
        
        System.debug('Multiple Accounts Created');
    }
 
}