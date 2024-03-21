trigger AccontDeleteTrigger on Account (Before Delete) 
{
    Map<Id,Boolean> mapData = new Map<Id,Boolean>();
    Try{
    if(Trigger.isBefore)
        {
            if(Trigger.isDelete)
                {
                    //Here before trigger will delete the record from trigger.old list
                    for(Account accountToDelete : Trigger.Old)
                    {
                        if(accountToDelete.Name !='ABC456')
                        {
                            mapData.put(accountToDelete.Id,true);
                            System.Debug('pass');
                        }
                        
                     }
                 
                 FutureClass.futuremethod(mapData.keySet());
                 for(Account accountToDelete : Trigger.Old)
                    {
                        if(mapData.get(accountToDelete.Id))
                        {
                            accountToDelete.Name.addError('You can\'t delete this account');
                            System.Debug('pass2');
                        }
                        
                     }
               }
        }
    }
    catch(Exception e)
    {
        System.Debug('nopass');
    }


}