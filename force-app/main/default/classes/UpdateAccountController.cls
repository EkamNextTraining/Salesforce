public class UpdateAccountController {
	public Account acc{get;set;}
    public UpdateAccountController(){
        acc = [SELECT Id, Name, Rating, Industry, Phone FROM Account LIMIT 1];
    }
    public PageReference updateAccount(){
        update acc;
        PageReference pr = new PageReference('/'+acc.Id);
        pr.setRedirect(true);
        return pr;
    }
}