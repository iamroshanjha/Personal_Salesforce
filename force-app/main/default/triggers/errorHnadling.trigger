trigger errorHnadling on Account (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    if(Trigger.isBefore && Trigger.isInsert)
    {
        errorHnadleApex.beforeInsert(Trigger.New);
    }
    
    if(Trigger.isAfter && Trigger.isInsert)
    {
        errorHnadleApex.afterInsert(Trigger.New);
    }
    

}