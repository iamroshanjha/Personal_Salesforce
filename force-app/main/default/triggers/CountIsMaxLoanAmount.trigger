trigger CountIsMaxLoanAmount on Contact (after insert, after update, after delete, after undelete) {
    List<AggregateResult> listAgg = [SELECT max(Loan_Amount__c) maxi FROM Contact ];
    Double maxivlaue = !listAgg.isEmpty() ? (Double)listAgg[0].get('maxi'):null;
    List<Contact> listContact = new List<Contact>();
    if(Trigger.isAfter)
    {
        for(Contact con : [SELECT Id, Loan_Amount__c, isMaxLoanAmount__c FROM Contact ])
        {
            Contact cont = new Contact();
            cont.id = con.id;
            if(maxivlaue!=null && con.Loan_Amount__c==maxivlaue) 
            {
                cont.isMaxLoanAmount__c=true;
                listContact.add(cont);
            }
            else
            {
                cont.isMaxLoanAmount__c=false;
                listContact.add(cont);
            }
        }
        
    }
    System.debug(customerTrigger.firstRun);
    if(customerTrigger.firstRun)
    {
        customerTrigger.firstRun=false;
        update listContact;
        
        System.debug(customerTrigger.firstRun);
    }
    
}