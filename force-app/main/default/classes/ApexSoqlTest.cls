@isTest
public class ApexSoqlTest {
    @testSetup
    public static void testSetup(){
        List<Account> accList = new List<Account>();
        for(Integer i=0;i<10;i++){
            Account acc = new Account(Name='ETest'+i+'A',Industry = 'Energy', AnnualRevenue=5000, Type='Prospect', NumberOfEmployees =20, Rating= 'Hot');
            accList.add(acc);
		}
        insert accList;
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<10;i++){
            Contact con = new Contact(LastName='test'+i, AccountId=accList[0].Id);
            conList.add(con);
		}
        insert conList;
    }
	@isTest
    public static void method1(){
        ApexSoql.getAccounts();
    }
    @isTest
    public static void method2(){
        ApexSoql.getAccount();
    }
	@isTest
    public static void method3(){
        ApexSoql.Accountrun();
    }
    @isTest
    public static void method4(){
        ApexSoql.getUniqueIndustries();
    }
    @isTest
    public static void method5(){
        ApexSoql.getAccountCount();
    }
    @isTest
    public static void method6(){
        ApexSoql.onlytwo();
    }
    @isTest
    public static void method7(){
        ApexSoql.getE();
    }
    @isTest
    public static void method8(){
        ApexSoql.getA();
    }
    
    @isTest
    public static void method9(){
    	List<Account> accList = new List<Account>();
        for(Integer i=0;i<10;i++){
            Account acc = new Account(Name='Test'+i,Industry = 'Energy', AnnualRevenue=500000, Type='Prospect', NumberOfEmployees = 6000);
            accList.add(acc);
		}
        insert accList;
        ApexSoql.whereor();
    }
    @isTest
    public static void method10(){
        ApexSoql.getContacts();
    }
    @isTest
    public static void method11(){
        Account acc = new Account(Name='Test',Industry = 'Insurance', AnnualRevenue=500000, Type='Prospect', NumberOfEmployees = 6000);
        insert acc;
        Case caseRecord = new Case(Status='Open',Origin='Phone', AccountId = acc.Id);
        ApexSoql.getCases();
    }
    
	@isTest
    public static void method12(){
        ApexSoql.getDetails();
    }
    @isTest
    public static void method13(){
        ApexSoql.getAcc();
    }
    @isTest
    public static void method14(){
        Account acc = new Account(Name='Test',Industry = 'Insurance', AnnualRevenue=500000, Type='Prospect', NumberOfEmployees = 6000);
        insert acc;
        Case caseRecord = new Case(Status='Open',Origin='Phone', AccountId = acc.Id);
        ApexSoql.getCaseCount();
    }
    @isTest
    public static void method15(){
        test.startTest();//It gives/renews the new set of governor limits.
        ApexSoql.createAccount();
        test.stopTest();
    }
    @isTest
    public static void method16(){
        ApexSoql.createContact();
        ApexSoql.deleteRecords();
        ApexSoql.deleteRec();
    }
}