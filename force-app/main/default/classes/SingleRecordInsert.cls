public class SingleRecordInsert {
    
    public static void createAccount(){
        
        Account acc = new Account();
        
        acc.Name = 'Test Data';
        acc.phone = '1234567890';
        acc.Industry = 'Technology';
        
        insert acc;
        System.debug('Account Created');
        System.debug('Inserted Account Id: ' + acc.Id);
    }

}