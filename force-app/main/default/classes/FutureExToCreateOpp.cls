public class FutureExToCreateOpp {
    @future
    public static void createOpportunitiesFutiure(set<Id> accIDSet){
        //createOpportunities(accIDSet);
        List<Opportunity> opplist = new List<Opportunity>();
        for(Id accID : accIDSet){
            Opportunity opp = new Opportunity(Name = 'Future Opp1',stagename='Qualification',CloseDate = System.today() , AccountId = accid);
            opplist.add(opp);
            System.debug(opplist);
        }
        insert opplist;
    }
    
    public static void createOpportunities(set<Id> accIDSet){
        List<Opportunity> opplist = new List<Opportunity>();
        for(Id accID : accIDSet){
            Opportunity opp = new Opportunity(Name = 'Future Opp1',stagename='Qualification',CloseDate = System.today() , AccountId = accid);
            opplist.add(opp);
            System.debug(opplist);
        }
        insert opplist;
    }
}