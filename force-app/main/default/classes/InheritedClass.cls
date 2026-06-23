public inherited sharing class InheritedClass {
    //If we are calling from parent apex class then parent security will be applied
    //If we are calling directly, then with sharing security will be applied.
	public static List<Account> getAccounts() {
		return [SELECT Id, Name FROM Account LIMIT 100];
    }
}