public class IfExample {
    
    public static void ifDemo(){
        
        Decimal opportunityAmount = 9000;
        
        if(opportunityAmount > 10000){
            
            System.debug('High Value Opportunity');
        }
        else{
            
            System.debug('Not accepted');
        }
    }

}