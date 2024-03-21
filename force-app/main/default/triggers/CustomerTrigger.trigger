trigger CustomerTrigger on APEX_Customer__c (after update, after insert) 
{
   if(Trigger.isAfter && Trigger.isUpdate)
  {
       customerTrigger.CreateInvoices(Trigger.New, Trigger.OldMap);
       customerTrigger.updateCustomerDescription(Trigger.New, Trigger.NewMap);
  }
    
  else if(Trigger.isAfter && Trigger.isInsert)
  {
      customerTrigger.CreateInvoicesifStatusActive(Trigger.New);
  }


}