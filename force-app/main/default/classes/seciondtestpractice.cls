public without sharing class seciondtestpractice {
	
    public static void main(){
        List<Account> lstAcc= new List<Account>();
        	Account acc = new Account();
        acc.name='Kumar Reddy';
        acc.Fax='1234567890';
        lstAcc.add(acc);
        //insert lstAcc;
        database.insert(lstAcc,false);
        //delete lstAcc;
		      
    }
}