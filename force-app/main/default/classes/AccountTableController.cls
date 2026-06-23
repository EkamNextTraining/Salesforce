public class AccountTableController {
    public List<Account> accounts{get;set;}
    //Constructor
    //Auto called method. Constructor name should be as class name.
    //create a instances for variables & assigning values
    public AccountTableController(){
		accounts = [SELECT Id, Name, Rating, Industry FROM Account LIMIT 10];
    }
}