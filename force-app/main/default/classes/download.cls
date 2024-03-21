public class download 
{
	public boolean isExport{get; set;}

    public list<contact> getcontacts()
    {
		isExport= false;
		list<contact> cc = new list<contact>();
		cc= [select id,firstname,lastname,email from contact];
		return cc;
	}
	
    public PageReference getexport() 
    {
        isExport= true;
        return null;
    }
}