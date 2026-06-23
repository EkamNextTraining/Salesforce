public class AggregateCountExample {
    
    public static void countAccounts(){
        
        Integer totalAccounts = [SELECT COUNT() FROM Account];
        
        System.debug('Total Accounts:' + totalAccounts);
    }

}