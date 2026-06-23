public class DynamicQueryClass {
    public static void getAccounts(){
        List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account];
    }
    public static void databaseQuery(String query){
        //String query = 'SELECT Id, Name, Rating, Industry FROM Account';
        List<Account> accounts = Database.query(query);
        system.debug(accounts);
    }
    public static void getRecords(String objName, string fieldNames){
        String query = 'SELECT '+fieldNames+ ' FROM '+objName;
        List<sObject> records = Database.query(query);
        system.debug(records);
        for(sObject rec : records){
            system.debug('Contact Name: '+rec.get('Name'));
            system.debug('Contact Email: '+rec.get('Email'));
        }
    }
    /*
     DynamicQueryClass.getRecords('Opportunity','Id, CloseDate, StageName, Amount');
	DynamicQueryClass.getRecords('Account','Id, Name, Rating, Industry');
	DynamicQueryClass.getRecords('Contact','Id, Name, Phone, Email');
*/
    public static void mapQuery(String recId){
        Map<String, Account> mapData = new Map<String, Account>();
        List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account];
        for(Account acc : accounts){
            mapData.put(acc.Name, acc);
        }
        
        Map<Id, Account> mapAccs = new Map<Id, Account>([SELECT Id, Name, Rating, Industry FROM Account]);
        //system.debug(mapAccs.keySet());
        //system.debug(mapAccs.values());
        system.debug(mapAccs.get(recId));
    }
    
    public static void createRecord(){
        
        system.debug('Hi');
        sObject accountRecord = (sObject)Type.forName('Account').newInstance();
        accountRecord.put('Name','May 22');
        accountRecord.put('Rating','Hot');
        accountRecord.put('Industry','Education');
        insert accountRecord;
        system.debug(accountRecord);
    }
    
    public static void dynamicRecordInsertion(sObject record){
        insert record;
        system.debug(record);
    }
    public static void dynamicRecordsInsertion(List<sObject> records){
        insert records;
        system.debug(records);
    }
    /*
     	List<sObject> recs = new List<sObject>();
        sObject accountRecord = (sObject)Type.forName('Account').newInstance();
        accountRecord.put('Name','May 24');
        accountRecord.put('Rating','Hot');
        accountRecord.put('Industry','Education');
        recs.add(accountRecord);
        sObject contactRecord = (sObject)Type.forName('Contact').newInstance();
        contactRecord.put('LastName','May 23');
        contactRecord.put('Email','kushal11@gmail.com');
        contactRecord.put('Phone','9874563211');
        recs.add(contactRecord);
        DynamicQueryClass.dynamicRecordsInsertion(recs);
*/
    /*
     sObject accountRecord = (sObject)Type.forName('Account').newInstance();
    accountRecord.put('Name','May 22');
    accountRecord.put('Rating','Hot');
    accountRecord.put('Industry','Education');
    
    sObject accountRecord = (sObject)Type.forName('Contact').newInstance();
    accountRecord.put('LastName','May 22');
    accountRecord.put('Email','kushal@gmail.com');
    accountRecord.put('Phone','9874563210');
    DynamicQueryClass.dynamicRecordInsertion(accountRecord);
    */
    
    
    
    public static void getAccountInfo(String recId){
        Map<String, Account> mapData = new Map<String, Account>();
        List<Account> accounts = [SELECT Id, Name, Rating, Industry FROM Account];
        for(Account acc : accounts){
            if(acc.Id == recId){
                system.debug(acc.Name);
            }
        }
        Map<Id, Account> mapAccs = new Map<Id, Account>([SELECT Id, Name, Rating, Industry FROM Account]);
        system.debug(mapAccs.get(recId).Name);
    }
    
    public static void mapFunctions(){
        Map<Integer, String> students = new  Map<Integer, String>{1=>'Kushal',2=>'Lokesh',3=>'Tharun',4=>'Deepak',5=>'Lokesh'};
        /*Map<Integer, String> students = new  Map<Integer, String>();
        students.put(1, 'Kushal');
        students.put(2, 'Lokesh');
        students.put(3, 'Tharun');
        students.put(4, 'Deepak');
        students.put(5, 'Lokesh');*/
        system.debug(students);
        Set<Integer> keys = new Set<Integer>();
        keys = students.keySet();
        system.debug(keys);
        List<String> values = new List<String>();
        values = students.values();
        system.debug(values);
        
        system.debug(students.get(3));
        
        system.debug(students.containskey(6));
    }
    
    
    public static void setFunctions(){
        Set<Integer> keys = new Set<Integer>{11,12,13,6};
        keys.add(7);
        system.debug(keys.size());
        system.debug(keys.toString());
        system.debug(keys.isEmpty());
        system.debug(keys.contains(7));
        system.debug(keys);
        keys.clear();
        system.debug(keys);
    }
    
}