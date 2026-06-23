public class AccountRelatedRecordsExample {

    public static void getAccountData() {

        
        List<Account> accList = [SELECT Id, Name,(SELECT Id, FirstName, LastName FROM Contacts),(SELECT Id, Name FROM Opportunities),(SELECT Id FROM Cases) FROM Account LIMIT 10];

        
        for(Account acc : accList) {

            System.debug('Account Id: ' + acc.Id);
            System.debug('Account Name: ' + acc.Name);

            
            System.debug('Contacts');

            for(Contact con : acc.Contacts) {
                System.debug('Contact Id: ' + con.Id);
                System.debug('Contact Name: ' + con.FirstName + ' ' + con.LastName);
            }

            
            System.debug('Opportunities');

            for(Opportunity opp : acc.Opportunities) {
                System.debug('Opportunity Id: ' + opp.Id);
                System.debug('Opportunity Name: ' + opp.Name);
            }

            
            System.debug('Cases');

            for(Case cs : acc.Cases) {
                System.debug('Case Id: ' + cs.Id);
            }

            System.debug('Success');
        }
    }
}