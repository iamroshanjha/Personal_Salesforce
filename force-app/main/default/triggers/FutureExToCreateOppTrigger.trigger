trigger FutureExToCreateOppTrigger on Account (after insert) {
    Set<Id> accIDSet = new Set<ID>();
    for(Account ac : Trigger.new){
      accIDSet.add(ac.Id);
    }
    FutureExToCreateOpp.createOpportunitiesFutiure(accIDSet);
}