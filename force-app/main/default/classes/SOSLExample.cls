public class SOSLExample {
    
    public static void searchRecords(){
        
        List<List<Sobject>> searchList = [FIND 'Tech' IN ALL FIELDS RETURNING Account(Id, Name), Contact(Id, FirstName, LastName)];
        
        List<Account> accList = (List<Account>)searchList[0];
        
        List<Contact> conList = (List<Contact>)searchList[1];
        
        for(Account acc: accList){
            
            System.debug('Account:' + acc.Name);
        }
        
        for(Contact con : conList){
            
            System.debug('Contact:' + con.FirstName + '' + con.LastName);
        }
                                 
                
    }

}