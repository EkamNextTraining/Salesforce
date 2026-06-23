public without sharing class WithoutSharingClass {
    //It ignores record level access
    //Runs with system admin context
	public static List<Account> fetchAccounts() {
		return InheritedClass.getAccounts();
    }
    //multiple params issue
    public static void method(Data param) {//(String name, Integer age, String city, String country)
		system.debug(param);
        system.debug(param.name);
    }
    public static void call(){
        Data data = new Data();
        data.name = 'Kushal';
        data.age = 20;
        data.city = 'Hyd';
        data.phone = '9874563210';
        data.country = 'India';
        WithoutSharingClass.method(data);
    }
    
    public class Data{
        public String name;
        public Integer age;
        public String city;
        public String phone;
        public String country;
    }
}