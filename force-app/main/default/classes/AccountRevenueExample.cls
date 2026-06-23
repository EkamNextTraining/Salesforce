public class AccountRevenueExample {
 
    public static void revenueCheck(){
 
        List<Account> accountList = [
 
            SELECT Name, AnnualRevenue
            FROM Account
            LIMIT 5
        ];
 
        for(Account acc : accountList){
 
            if(acc.AnnualRevenue != null &&
               acc.AnnualRevenue > 100000){
 
                System.debug(acc.Name +
                ' is a Premium Customer');
            }
            else{
 
                System.debug(acc.Name +
                ' is a Regular Customer');
            }
        }
    }
}