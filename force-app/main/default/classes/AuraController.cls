public class AuraController {
    @AuraEnabled
    public static Account createAccount(Account acc){
        insert acc;
        return acc;
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        return [SELECT Id, Name, Rating, Industry FROM Account];
    }
}