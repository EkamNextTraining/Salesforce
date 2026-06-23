public class CustomConfig {
    public static void getAcc(){
        system.debug([SELECT Id, Name FROM Account WHERE Name=:System.Label.BankName LIMIT 1].Name);
    }
    public static void getCurrentUserCustomSettingRecord(){
        Discount__c discount = Discount__c.getInstance();
        system.debug(discount.Discount__c);
        system.debug(discount.Mobile_Name__c);
    }
    public static void getUserCustomeSettingRecord(Id userId){
        Discount__c discount = Discount__c.getInstance(userId);
        system.debug(discount.Discount__c);
        system.debug(discount.Mobile_Name__c);
    }
    public static void getProfileCustomeSettingRecord(Id profileId){
        Discount__c discount = Discount__c.getInstance(profileId);
        system.debug(discount.Discount__c);
        system.debug(discount.Mobile_Name__c);
    }
     public static List<MobileDiscounts__c> getListCustomSettings(){
        List<MobileDiscounts__c> data = [SELECT Id, Discount__c, Mobile_Name__c, SetupOwner.Name FROM MobileDiscounts__c];
        system.debug(data);
         return data;
    }
    public static void getMetadataRecords(){
        List<Discounts__mdt> data = [SELECT Id,Discount__c, MasterLabel,DeveloperName  FROM Discounts__mdt];
        system.debug(data);
    }
    public static void getDynamicQuery(String obj){
        Dynamic_Query__mdt data = [SELECT Id,Fields__c, FilterField__c, FilterValue__c, MasterLabel,DeveloperName  FROM Dynamic_Query__mdt WHERE MasterLabel=:obj LIMIT 1];
        String query = 'SELECT '+data.Fields__c+' FROM '+obj+ ' WHERE '+data.FilterField__c+'='+'\''+data.FilterValue__c+'\'';
        system.debug(query);
        system.debug(Database.query(query));
    }
    public static void sendEmail(){
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage(); 
        message.toAddresses = new String[] { 'nextekam@gmail.com','umamaheshsfdc7@gmail.com' };
        message.subject = 'Test Message';
        message.plainTextBody = 'This is the message body.';   
        Messaging.SingleEmailMessage[] messages = 
            new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        
        
        if (results[0].success) {
            System.debug('The email was sent successfully.');
        } else {
            System.debug('The email failed to send: '
                  + results[0].errors[0].message);
        }
    }
}