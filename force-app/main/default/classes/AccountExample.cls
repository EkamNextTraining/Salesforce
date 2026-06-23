public class AccountExample {
    
    public static void createAccount(){
        
        Account acc = new Account();
        
        acc.Name = 'Tech Solutions';
        acc.Phone = '1234567890';
        acc.Industry = 'Technology';
        
        insert acc;
        
        System.debug('Account Created Successfully');
    }

}