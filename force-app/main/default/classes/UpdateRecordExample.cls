public class UpdateRecordExample {
    
    public static void updateAccountName(){
        
        Account acc = [SELECT Id, Name FROM Account WHERE Name = 'Tech Solutions' LIMIT 1];
        
        acc.Name = 'ABC Technologies';
        
        update acc;
        
        System.debug('Updated successfully');
    } 

}