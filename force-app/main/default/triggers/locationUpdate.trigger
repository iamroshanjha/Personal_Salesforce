trigger locationUpdate on User (before insert) {
Map<ID, String> userIdVSLocation = new Map<ID, String>();
	for(User us : Trigger.New)
	{
		if(us.Name != null && us.Name != Trigger.oldMap.get(us.Id).Name)
		{
			userIdVSLocation.put(us.Id, us.Name);
		}
	}

	List<Opportunity> lstOppty = [SELECT ID, Name from Opportunity WHERE
	OwnerId IN :userIdVSLocation.KeySet()];

	for(Opportunity oppty:lstOppty)
	{
		oppty.Name = userIdVSLocation.get(oppty.OwnerId);
	}

	update lstOppty;
}