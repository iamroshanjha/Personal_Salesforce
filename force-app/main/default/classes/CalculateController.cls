public class CalculateController {
	public Integer num1 {get;set;}
    public Integer num2 {get;set;}
    public Integer result {get;set;}
    public string operation {get;set;}
    
    public void calc()
    {
        if(operation.Contains('+'))
        {
            result=num1+num2;
        }
        if(operation.Contains('-'))
        {
            result=num1-num2;
        }
        if(operation.Contains('*'))
        {
            result=num1*num2;
        }
        if(operation.Contains('/'))
        {
            result=num1/num2;
        }             
       
    }
    
    public PageReference calcnext()
    {
        if(operation.Contains('+'))
        {
            result=num1+num2;
        }
        if(operation.Contains('-'))
        {
            result=num1-num2;
        }
        if(operation.Contains('*'))
        {
            result=num1*num2;
        }
        if(operation.Contains('/'))
        {
            result=num1/num2;
        }
        
        PageReference requestPage = Page.CalculatorTestPage2;
		requestPage.setRedirect(false);
		return requestPage;
                
    }
}