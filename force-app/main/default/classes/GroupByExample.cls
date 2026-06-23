public class GroupByExample {
    
    public static void accountIndustryCount(){
        
        AggregateResult[] results = [SELECT Industry, COUNT(Id) total FROM Account GROUP BY Industry];
        
        for(AggregateResult ar : results){
            
            System.debug('Industry:' + ar.get('Industry') + 'Count: ' + ar.get('total'));
        }
    }

}