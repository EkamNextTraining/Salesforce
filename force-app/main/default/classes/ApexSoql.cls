public class ApexSoql {
    //1. "Get a list of Account (Name, Phone, Type, Annual Revenue, Industry). Filter by Industry field. Industry should be Energy Print Account Name, Annual Revenue"
    public static void getAccounts() {
        List<Account> accList = [
            SELECT Name, Phone, Type, AnnualRevenue, Industry
            FROM Account
            WHERE Industry = 'Energy'
        ];
        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
            System.debug('Annual Revenue : ' + acc.AnnualRevenue);
        }
    }
    
    //2. "Get a list of Account (Name, Phone, Type, Annual Revenue, Industry) Filter by Industry field. Industry should be Energy & EducationFilter by by Employee field. Employee Annual Revenue should be greater than or equal to 5000 Print Account Name, Employee"
     public static void getAccount() {
        List<Account> accList = [
            SELECT Name, Phone, Type, AnnualRevenue, Industry, NumberOfEmployees
            FROM Account
            WHERE Industry IN ('Energy', 'Education')
            AND AnnualRevenue >= 5000
        ];
        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
            System.debug('Employees : ' + acc.NumberOfEmployees);
        }
    }
    //3. "Get a list of Account (Name, Phone, Type, Annual Revenue, Industry) Filter by Type field. Type should not be null Filter By Annual Revenue. Annual Revenue should be lesser than 25000 Filter by Industry field. Industry should be either Apparel or Energy or Consulting Print Account Name, Type, Annual Revenue, Industry"
    
    public static void Accountrun() {

        List<Account> accList = [
            SELECT Name, Phone, Type, AnnualRevenue, Industry
            FROM Account
            WHERE Type != null
            AND AnnualRevenue < 25000
            AND Industry IN ('Apparel', 'Energy', 'Consulting')
        ];

        for(Account acc : accList) {

            System.debug('Account Name : ' + acc.Name);
            System.debug('Type : ' + acc.Type);
            System.debug('Annual Revenue : ' + acc.AnnualRevenue);
            System.debug('Industry : ' + acc.Industry);
        }
    }
    
    //4. "Get a list of unique Industry field values from Account and print them Hint: Use Set"
    public static void getUniqueIndustries() {
        Set<String> industrySet = new Set<String>();
        List<Account> accList = [
            SELECT Industry
            FROM Account
        ];    
        for(Account acc : accList) {

            if(acc.Industry != null) {
                industrySet.add(acc.Industry);
            }
        }       
        System.debug(industrySet);
    }

    
    //5 ."Get/Print count of Account records from AccountFilter by Industry field. Industry can be one of this: Apparel, Consulting, Energy or Hospitality"
   public static void getAccountCount() {

        Integer accCount = [
            SELECT COUNT()
            FROM Account
            WHERE Industry IN ('Apparel', 'Consulting', 'Energy', 'Hospitality')
        ];

        System.debug('Total Account Count : ' + accCount);
    }
    
    //6."Get/Print a Map of Unique Industry names from Account object like this: <Industry, No of Accounts in that industry> E.g.: <Energy, 3>, Consulting, 2>, <Biotechnology, 1>, etc"
    
    //7. "Get/Print Account Name from Account objectFilter by Industry field. Industry should be EnergyOnly 2 account names should be printed even if there are 10 accounts
    public static void onlytwo() {

        List<Account> accList = [
            SELECT Name
            FROM Account
            WHERE Industry = 'Energy'
            LIMIT 2
        ];

        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
        }
    }
    
    //8. "Get/Print Account Name from Account object Filter by Name field. Name should start with alphabet E"
    public static void getE() {

        List<Account> accList = [
            SELECT Name
            FROM Account
            WHERE Name LIKE 'E%'
        ];

        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
        }
    }
    
    //9. "Get/Print Account Name from Account object Filter by Name field. Name should end with alphabet A"
    public static void getA() {

        List<Account> accList = [
            SELECT Name
            FROM Account
            WHERE Name LIKE '%A'
        ];

        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
        }
    }

    //10. Get/Print Account records (Name, Phone, Type, Industry)Filter by Employee field. Employee should be more than or equal to 5000 and lesser than or equal to150000
    public static void whereor() {
        List<Account> accList = [
            SELECT Name, Phone, Type, Industry, NumberOfEmployees, AnnualRevenue
            FROM Account
            WHERE 
            (
                NumberOfEmployees >= 5000
                AND NumberOfEmployees <= 150000
            )
            OR
            (
                AnnualRevenue >= 500000
            )
        ];
        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
            System.debug('Phone : ' + acc.Phone);
            System.debug('Type : ' + acc.Type);
            System.debug('Industry : ' + acc.Industry);
        }
    }
    
    //11. Write an soql query which returns contact details along with its account details where the NumberOfEmployees are less than 25.
     public static void getContacts() {
        List<Contact> conList = [
            SELECT Id, FirstName, LastName, Email,
                   Account.Name, Account.NumberOfEmployees
            FROM Contact
            WHERE Account.NumberOfEmployees < 25
        ];
        for(Contact con : conList) {
            System.debug('Contact Name : ' + con.FirstName + ' ' + con.LastName);
            System.debug('Account Name : ' + con.Account.Name);
            System.debug('Employees : ' + con.Account.NumberOfEmployees);
        }
    }
    
    //12. write an soql query which returns last two months (may and june) cases details of the accounts where its industry is Insurance and Finance.
    public static void getCases() {

        List<Case> caseList = [
            SELECT Id, CaseNumber,CreatedDate,
                   Account.Name, Account.Industry
            FROM Case
            WHERE Account.Industry IN ('Insurance', 'Finance')
            AND CreatedDate = LAST_N_MONTHS:2
        ];

        for(Case cs : caseList) {
            System.debug('Case Number : ' + cs.CaseNumber);         
            System.debug('Created Date : ' + cs.CreatedDate);
            System.debug('Account Name : ' + cs.Account.Name);
            System.debug('Industry : ' + cs.Account.Industry);
        }
    }
    
    //13. write an soql query which returns account details and contact details that are created this month where the account rating is hot and cold.
    public static void getDetails() {
        List<Contact> conList = [
            SELECT FirstName, LastName,
                   Account.Name, Account.Rating
            FROM Contact
            WHERE CreatedDate = THIS_MONTH
            AND Account.Rating IN ('Hot', 'Cold')
        ];
        for(Contact con : conList) {
            System.debug('Contact Name : ' + con.FirstName + ' ' + con.LastName);
            System.debug('Account Name : ' + con.Account.Name);
            System.debug('Rating : ' + con.Account.Rating);
        }
    }
    
    //14. write an soql query which returns list of accounts which has no opportunities and no cases linked to it.
     public static void getAcc() {
        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            WHERE Id NOT IN (
                SELECT AccountId
                FROM Opportunity
            )
            AND Id NOT IN (
                SELECT AccountId
                FROM Case
            )
        ];
        for(Account acc : accList) {
            System.debug('Account Name : ' + acc.Name);
        }
    }
    
    //15. write an soql query which returns the total no of cases which are New/Open for accounts whose revenue greater than 10000.
    public static void getCaseCount() {
        Integer caseCount = [
            SELECT COUNT()
            FROM Case
            WHERE Status IN ('New', 'Open')
            AND Account.AnnualRevenue > 10000
        ];

        System.debug('Total Cases : ' + caseCount);
    }
    
    //16 .Create a new Account record using Inline declaration and Initilization. Use any field values
    public static void createAccount() {     
        Account acc = new Account(
            Name = 'Tech Solutions',
            Phone = '9876543210',
            Industry = 'Energy',
            Type = 'Customer',
            AnnualRevenue = 500000
        );
        insert acc;
        System.debug('Account Created Successfully');
    }
    
    //17. Create a new Contact record using Inline declaration and Initilization. Use any field values
      public static void createContact() {     
        Contact con = new Contact(
            FirstName = 'Aryan',
            LastName = 'Karve',
            Email = 'aryan@test.com',
            Phone = '9876543210'
        );
        insert con;
        System.debug('Contact Created Successfully');
    }
    
    //23. Delete all Account records where Annual Revenue value is blank/null
    public static void deleteRecords() {
        List<Account> accList = [
            SELECT Id, Name, AnnualRevenue
            FROM Account
            WHERE AnnualRevenue = null
        ];
        delete accList;
        System.debug('Accounts Deleted Successfully');
    }
    
    //24. "Delete all Account records where Name ends with a number E.g. Account 1, Account 2, Account 3….."
    public static void deleteRec() {
        List<Account> accList = [
            SELECT Id, Name
            FROM Account
            WHERE Name LIKE '%[0-9]'
        ];
        delete accList;
        System.debug('Accounts Deleted Successfully');
    }
}