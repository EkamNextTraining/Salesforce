@isTest
public class SOQLExampleTest {
    
    @testSetup
    public static void testSetup(){
        Account acc = new Account(Name='Test',Industry = 'Technology');
        insert acc;
    }
	@isTest
    public static void method1(){
        SOQLExample.getAccount();
    }
}