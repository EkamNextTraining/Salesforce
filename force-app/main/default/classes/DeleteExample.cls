public class DeleteExample {
    
    public static void deleteAccount(){
        
        Account acc = [SELECT Id, Name FROM Account WHERe Name = 'Techi Solutions' LIMIT 1];
        
        delete acc;
        
        System.debug('record is deleted');
    }

}