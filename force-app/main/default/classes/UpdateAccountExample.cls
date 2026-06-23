public class UpdateAccountExample {
    
    public static void updateAccount(){
        
        Account acc = [SELECT Id, Name FROM Account LIMIT 1];
        
        acc.Name = 'Updated Account Name';
        
        update acc;
        
        System.debug('Account Updated');
    }

}