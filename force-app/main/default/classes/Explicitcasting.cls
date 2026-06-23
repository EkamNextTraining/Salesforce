public class Explicitcasting {
    
    public static void explicit(){
        
        Decimal annualRevenue = 2678.64;
        Integer roundedValue = Integer.valueOf(annualRevenue);
        
        System.debug(roundedValue);
    }

}