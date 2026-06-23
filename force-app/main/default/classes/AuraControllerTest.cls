@isTest
public class AuraControllerTest {
	@isTest
    public static void create(){
        Account acc = new Account(Name='Test');
        AuraController.createAccount(acc);
        AuraController.getAccounts();
    }
}