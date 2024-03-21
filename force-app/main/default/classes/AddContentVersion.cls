public class AddContentVersion {
    public static void addContent()
    {
        Account acc = new Account(Name='Test Account');
        Insert acc;
        System.Debug(acc.Id);
        
        //Create Document
        ContentVersion cv = new ContentVersion();
        cv.Title = 'Test Document';
        cv.PathOnClient = 'TestDocument.txt';
        cv.VersionData = Blob.valueOf('Test Content');
        cv.IsMajorVersion = false;
        Insert cv;
        
        //Get Content Documents
        Id conDocId = [SELECT ContentDocumentId FROM ContentVersion WHERE Id =:cv.Id].ContentDocumentId;
        
        //Create ContentDocumentLink 
        ContentDocumentLink cdl = New ContentDocumentLink();
        //cdl.LinkedEntityId = acc.Id;
        cdl.LinkedEntityId = '0016F00003aOAaXQAW';
        cdl.ContentDocumentId = conDocId;
        cdl.shareType = 'V';
        Insert cdl;
    }
}