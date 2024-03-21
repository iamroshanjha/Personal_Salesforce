trigger updateAccountData on Account_Salary__c(after insert, after update, after delete, after undelete)
{
    set<Id> setAccountIds = new set<Id>();
    List<Account> accountToUpdate = new List<Account>();
    if(Trigger.isInsert || Trigger.isUndelete)
    {
        for(Account_Salary__c accSal : Trigger.new)
        {
            setAccountIds.add(accSal.Account__c);
        }
    }

    if(Trigger.isUpdate)
    {
        for(Account_Salary__c accSal : Trigger.new)
        {
            if(accSal.Salary__c != trigger.oldMap.get(accSal.id).Salary__c)
            {
                setAccountIds.add(accSal.Account__c);
            }                                                                   
        }
    }

    if(Trigger.isDelete)
    {
        for(Account_Salary__c accSal : Trigger.old)
        {
            setAccountIds.add(accSal.Account__c);
        }
    }
/*
    for(AggregateResult agg : [Select SUM(Salary__c) sum, MAX (Salary__c) max, Account__c from Account_Salary__c where Account__c IN : setAccountIds GROUP BY Account__c])
    {
        accountToUpdate.add(new Account(Id=(ID)agg.get('Account__c'), Total_Salary__c = (Decimal)agg.get('sum'), Max_Salary__c = (Decimal)agg.get('max')));
    }

    if(!accountToUpdate.isEmpty())
    {
        update accountToUpdate;
    }

*/
    
    for (Account acc : [SELECT Id, (SELECT Salary__c FROM Account_Salary__r) FROM Account WHERE Id IN :setAccountIds]) {
            Decimal totalSalary = 0;
            Decimal maxSalary = 0;
            for (Account_Salary__c sal : acc.Account_Salary__r) {
                totalSalary += sal.Salary__c;
                if (sal.Salary__c > maxSalary) {
                    maxSalary = sal.Salary__c;
                }
            }
            acc.Total_Salary__c = totalSalary;
            acc.Max_Salary__c = maxSalary;
            accountToUpdate.add(acc);
        }
        update accountToUpdate;  
}