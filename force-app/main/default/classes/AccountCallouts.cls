public class AccountCallouts {
    public static void getAccount(){
        Http h = new Http();

        // Instantiate a new HTTP request
        // Specify request properties such as the endpoint, the POST method, etc. 
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce/services/apexrest/AccountServiceAPI/');
        req.setMethod('GET');
        req.setHeader('Content-Type', 'application/json');
    
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        system.debug(res.getBody());
    }
    public static void createAccount(){
        Account acc = new Account(Name='Testttt', Rating='Hot');
        Http h = new Http();
        String s = '{"Name":"Testttt","Rating":"Hot"}';
        
        // Instantiate a new HTTP request
        // Specify request properties such as the endpoint, the POST method, etc. 
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Salesforce/services/apexrest/AccountServiceAPI/');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
    	req.setBody(JSON.serialize(acc));
        // Send the request, and return a response
        HttpResponse res = h.send(req);
        system.debug(res.getBody());
    }
}