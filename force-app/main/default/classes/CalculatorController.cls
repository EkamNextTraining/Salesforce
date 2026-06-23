public class CalculatorController {
    public Decimal num1{get;set;}
    public Decimal num2{get;set;}
    public Decimal result{get;set;}
    public void add(){
        result = num1+num2;
    }
    public void sub(){
        result = num1-num2;
    }
    public void mul(){
        result = num1*num2;
    }
    public void div(){
        result = num1/num2;
    }
}