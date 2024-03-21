public class QuizControlller 
{
    public List<Quiz__c> quizTemp = new List<Quiz__c>();
    public string answer{get;set;}
    public string query{get;set;}
    public string result{get;set;}
    
    public QuizControlller()
    {
    
    }
    
    public List<SelectOption> questionList
    {
        get
        {
            quizTemp = [Select Id, Qusstion__c From Quiz__c];
            
            questionList = new List<SelectOption>();
            
            for(Quiz__c temp : quizTemp)
            {
                questionList.add(new SelectOption(temp.Id,temp.Qusstion__c));
            }
            return questionList;
        }
        set;
    }
    
    public void validate()
    {
        List<Quiz__c> answerData = [Select Answer__c From Quiz__c where id=:query];
        string answerExact;
        for(Quiz__c ans : answerData)
        {
            answerExact = ans.Answer__c;
        }
        
        if(answer.equalsIgnoreCase(answerExact))
        {
            result='Congratulations its correct';
        }
        else
        {
            result='Alas its wrong';
        }
    }
    
    public PageReference validateNext()
    {
        List<Quiz__c> answerData = [Select Answer__c From Quiz__c where id=:query];
        string answerExact;
        for(Quiz__c ans : answerData)
        {
            answerExact = ans.Answer__c;
        }
        
        if(answer.equalsIgnoreCase(answerExact))
        {
            result='Congratulations its correct';
        }
        else
        {
            result='Alas its wrong';
        }
        
        PageReference requestPage = Page.QuizUINext;
		requestPage.setRedirect(false);
		return requestPage;
    }
}