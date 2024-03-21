global class TestBatch implements  Database.Batchable<sObject> {
	
    global Database.Querylocator start (Database.BatchableContext BC) {
        String query = 'select id , name,Description from contact order by createddate desc LIMIT 10';
        return Database.getQueryLocator(query);
        
    }
    
    global void execute (Database.BatchableContext BC, List<Contact> conList) {
        /*for(Contact con : conList)
            con.Description='Test Batch';
        update conList;*/
        System.assert(true);
        
    }
    
    global void finish (Database.BatchableContext BC) {
        system.debug('finish......');
        /*List<String> email = new List<String>{'kalyaniddhaktod@gmail.com','roshanjha2095@gmail.com'};
      Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
      
      // Below code will fetch the job Id
      AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors,
      a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById,
      a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];
      
      // get the job Id
      System.debug('$$$ Jobid is'+BC.getJobId());
      
      // below code will send an email to User about the status
      mail.setToAddresses(email);
      mail.setReplyTo('RoshanJha2095@gmail.com'); // Add here your email address
      mail.setSenderDisplayName('Apex Batch Processing Module');
      mail.setSubject('Batch Processing '+a.Status);
      mail.setPlainTextBody('The Batch Apex job processed'
         + a.TotalJobItems+'batches with '+a.NumberOfErrors+'failures'+'Job Item processed are'+a.JobItemsProcessed);
      Messaging.sendEmail(new Messaging.Singleemailmessage [] {mail});*/
    }
    /* global void execute(SchedulableContext sc) {
      TestBatch conInstance = new TestBatch();
      database.executebatch(conInstance,1);
   }*/
}