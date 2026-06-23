public with sharing class SecureAccountService {
    public static void insertAccounts() {
        WithoutSharingClass.Data data = new WithoutSharingClass.Data();
        Account acc = new Account(Name = 'Test Account');
        //insert acc;
        
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.CREATABLE,new List<Account>{acc});
		insert decision.getRecords();
    }
    public static void updateAccounts(String accountId) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
		acc.Name = 'Updated Account';
		//update acc;
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.UPDATABLE,new List<Account>{acc});
		update decision.getRecords();
    }
    public static void upsertAccounts(List<Account> accounts) {
        Account acc = new Account(Name = 'Upsert Account');

        //upsert acc;
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.UPSERTABLE,new List<Account>{acc});
		upsert decision.getRecords();
    }

    public static void deleteAccounts(String accountId) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        if (Schema.sObjectType.Account.isDeletable()) {
            delete acc;
        } else {
            system.debug('You do not have permission to delete Accounts.');
        }
        
    }
    public static void undeleteAccounts(String accountId) {
        Account acc = [SELECT Id, Name FROM Account WHERE Id = :accountId LIMIT 1];
        if (Schema.sObjectType.Account.isUnDeletable()) {
            undelete acc;
        } else {
            system.debug('You do not have permission to delete Accounts.');
        }
        //undelete acc;
    }
    public static Database.SaveResult[] databaseInsert(List<Account> accounts ) {
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.CREATABLE, accounts);
		return Database.insert(decision.getRecords(),false);
    }
    public static Database.SaveResult[] databaseUpdate(List<Account> accounts) {
        SObjectAccessDecision decision = Security.stripInaccessible(AccessType.UPDATABLE,accounts);
        return Database.update(decision.getRecords(),false);
    }
}