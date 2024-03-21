trigger CaseAssignment on Case (before insert, before update) {
    set<Id> userId = new set<Id>();
    set<Id> queueId = new set<Id>();
    for(Case cs : Trigger.New)
    {
        if(cs.OwnerId.getSobjectType()==Schema.Group.SObjectType)
        {
            queueId.add(cs.OwnerId);
        }
        else
        {
            userId.add(cs.OwnerId);
        }
    }
    
    for(GroupMember gp : [SELECT UserOrGroupId, Group.name FROM GroupMember where GroupId IN : queueId])
    {
        userId.add(gp.UserOrGroupId);
    }
    Map<id,Integer> data = new Map<id,Integer>();
    List<AggregateResult> lstAgg = [SELECT Count(Id) countCase,OwnerId FROM Case GROUP By OwnerId];
    for(AggregateResult agg : lstAgg)
    {
        if(userId.contains((ID)agg.get('OwnerId')))
            data.put((ID)agg.get('OwnerId'),(Integer)agg.get('countCase'));
    }
        
    for(Case cs : Trigger.New)
    {
        if(data.get(cs.OwnerId)>=5)
        {
            cs.OwnerId.addError('already 5 cases assigned to this owner');
        }
        
    }
}