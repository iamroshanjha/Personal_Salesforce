global class SMSUtility {
    
    @InvocableMethod(label='Send SMS' description='method description')
    // here input param is smsRequest of List type
    global static void smsList(smsRequest[] requests){
        for (smsRequest request : requests) {
           System.debug('requests '+requests);
        }
    }
    
    
    global class smsRequest {
        @InvocableVariable(required=true)
        global String toNumber;
        
        @InvocableVariable(required=true)
        global String smsBody;
        
        @InvocableVariable
        global String appointmentDate;
    }
    
}