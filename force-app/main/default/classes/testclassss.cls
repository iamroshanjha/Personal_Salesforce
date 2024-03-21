public class testclassss {
    
    public static void data(){
        List<Account> acc = [Select id from Account limit 10];
        data2();
        Map<Account,List<Contact>> acc1 = new Map<Account,List<Contact>>();
    }
    @future
    public static void data2(){
        //List<Account> acc = [Select id from Account limit 10];
        List<Contact> con = [Select id from Contact limit 10];
        Integer data=0;
        for(List<Contact> con1 : [Select id from Contact limit 10]){
            data++;
            for(Contact con12 : con1){
            data++;
            
        }
            
        }
        System.debug(data);
    }

}