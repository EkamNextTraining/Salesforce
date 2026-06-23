public class CreateAccountController {
    public Account acc{get;set;}
    public CreateAccountController(){
        acc = new Account();
    }
    public PageReference createAccount(){
        insert acc;
        PageReference pr = new PageReference('/'+acc.Id);
        pr.setRedirect(true);
        return pr;
    }
}