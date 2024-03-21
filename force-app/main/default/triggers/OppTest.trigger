trigger OppTest on Opportunity (after insert) {
        for(Opportunity opp : Trigger.New)
            System.Debug('opp name'+opp.Account.Name);
}