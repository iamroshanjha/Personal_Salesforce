public class aggregateclass {
    
    public static void main()
    {
        List<AggregateResult> lstagg = [select count(Id) , AccountId from Contact where name=:System.label.name group by AccountId ];
        for(AggregateResult agg : lstagg)
        {
            System.debug(agg.get('expr0')+' : '+agg.get('AccountId'));
        }
        //Integer countContatct = lstagg[0].get('countContact');
        
    }

}