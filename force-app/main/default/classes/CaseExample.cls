public class CaseExample {
    
    public static void caseDemo(){
        
        String rating = 'Cold';
        
        switch on rating {
            
            when 'Hot'{
                
                System.debug('Immediate Follow up');
            }
            when 'Warm'{
                
                System.debug('Follow up Later');
              
            }
            when else {
                
                System.debug('Normal');
            }
        }
    }

}