public class SFDCTask {
    public String Email{get;set;}
    public List<Lead> lstLeads{get;set;}
    public String leadsId{get;set;}
    
    public void Submit()
    {
        lstLeads = [SELECT Id, FirstName, LastName, Phone, Address, Email FROM Lead where Email=:Email];
        //System.Debug('Address '+lstLeads[0].Address);
    }
    public void Convert()
    {
        System.Debug('id '+leadsId);
       	Database.LeadConvert lc = new Database.LeadConvert();
		lc.setLeadId(leadsId);
		LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
		lc.setConvertedStatus(convertStatus.MasterLabel);

		Database.LeadConvertResult lcr = Database.convertLead(lc);
        if(lcr.isSuccess()){
        //for(Database.LeadConvertResult lctemp: lcr){
            system.debug(lcr.getAccountId());
            system.debug(lcr.getContactId());
            apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Confirm,'Lead Converted'));
        //}
        }
        else{
            apexpages.addMessage(new ApexPages.message(Apexpages.Severity.Error,'Lead Conversion Failed'));
        }
    }
}