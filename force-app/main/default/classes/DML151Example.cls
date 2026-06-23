public class DML151Example {
    
    public static void practice(){
        
        for(Integer i = 1; i <= 151; i++){
            
            Account acc = new Account(
              Name = 'Demo' + i
            );
            
            insert acc;
        }
    }

}