public class ApexBasics {
    //1. Write a program that prints ‘Hello World’ to the screen
    public static void task1(){
        List<Account> acc =  [SELECT Id, Name, Rating, Industry FROM Account];
        for(Account accRec : acc){
            system.debug(accRec.Name);
        }
    }
    //2. Write a program that asks the user for their name and greets them with their name
    public static void task2(){
        
    }
    //3. Write a program to add two numbers 5 and 50
    public static void task3(){
        
    }
    //4. Write a program to add all numbers in both the lists together A = 1,5,8,11,15 B = 20,15,17,18,70
    public static void task4(){
        
    }
}