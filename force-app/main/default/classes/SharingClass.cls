public with sharing class SharingClass {
    //Checks the record level access
    //OWD, Role Hierarchy, Manual Sharing, Sharing Rules
	public static List<Account> fetchAccounts() {
		return InheritedClass.getAccounts();
    }
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, AnnualRevenue FROM Account WITH SECURITY_ENFORCED];
    }
    
    public static List<Account> getAccountRecords() {
        String query = 'SELECT Id, Name FROM Account WITH SECURITY_ENFORCED';
		List<SObject> records = Database.query(query);
        return records;
    }
}