public with sharing class HilleBrandProductsController {
    @AuraEnabled(cacheable=true)
    public static List<List<String>> getProducts(String sobjectName, String fieldSetName)
    {
        List<List<String>> reponseData = new List<List<String>>();
        try
        {
            Schema.FieldSet sObjectfieldSet = Schema.getGlobalDescribe().get(sobjectName).getDescribe().fieldSets.getMap().get(fieldSetName);
            if(sObjectfieldSet == null)
                return reponseData;
            
            List<Schema.FieldSetMember> sObjectfields = sObjectfieldSet.getFields();
            if(sObjectfields.isEmpty())
                return reponseData;
            
            List<SObject> lstRecords = getRecords(sobjectName,sObjectfields); 
            if(lstRecords.isEmpty())
                return reponseData;
            
            List<String> header = new List<String>();
            for(Schema.FieldSetMember fields : sObjectfields)
            {
                header.add(fields.getLabel());
            }
            reponseData.add(header);
            for(SObject records: lstRecords)
            {
                List<String> data = new List<String>();
                for(Schema.FieldSetMember fields : sObjectfields)
                {
                    data.add(String.valueOf(records.get(fields.getFieldPath())));
                }
                reponseData.add(data);
            }
        }
        catch(Exception e)
        {
            System.debug(e.getLineNumber()+e.getMessage()+e.getStackTraceString());
            //Logger Code can be added here
        }
        System.debug(reponseData);
        return reponseData;
    }
    
    static List<SObject> getRecords(String sobjectName,List<Schema.FieldSetMember> productfields){
        List<SObject> lstRecords = new List<SObject>();
        if(Schema.getGlobalDescribe().get(sobjectName).getDescribe().isAccessible())
        {
            String query = 'SELECT Id ';
            for(Schema.FieldSetMember f : productfields) 
            {
                query += ', '+f.getFieldPath();
            }
            query += ' FROM '+sobjectName+' order by CreatedDate DESC';
            lstRecords = Database.query(query);
        }
        return lstRecords;
    }
    
    
    @AuraEnabled (cacheable=true)
    
    public static String getFieldsAndRecords(String strObjectApiName, String strfieldSetName,
                                             
                                             String criteriaField, String criteriaFieldValue)
    {
        
        Wrapper returnMap = new Wrapper();
        
        if(!String.isEmpty(strObjectApiName) && !String.isEmpty(strfieldSetName)){
            
            //get fields from FieldSet
            
            SObject sObj = (SObject)(Type.forName('Schema.'+ strObjectApiName).newInstance());
            
            List<Schema.FieldSetMember> lstFSMember = 
                
                sObj.getSObjectType().getDescribe().fieldSets.getMap().get(strfieldSetName).getFields();
            
            
            
            //prepare SOQL query based on fieldAPIs 
            
            String query = 'SELECT ';
            
            for(Schema.FieldSetMember f : lstFSMember) {
                
                query += f.getFieldPath() + ', ';
                
            }
            
            query += 'Id FROM ' + strObjectApiName;
            
            
            
            //Just in case criteria field not specified then it will return all records
            
            if(!(String.isEmpty(criteriaField) && String.isEmpty(criteriaFieldValue))){
                
                query += ' WHERE ' + criteriaField + '=\'' + criteriaFieldValue + '\'';
                
            }
            
            
            
            //execute query
            
            List<SObject> lstRecords = Database.query(query);
            
            
            
            //prepare a map which will hold fieldList and recordList and return it
            
            returnMap.column = lstFSMember;
            
            returnMap.row =  lstRecords;
            System.debug('column '+returnMap.column);
            System.debug('row '+returnMap.row);
            return JSON.serialize(returnMap).replace('fieldPath','fieldName');
            
        }
        
        return null;
        
    }
    public class Wrapper{
        public List<SObject> row;
        public List<Schema.FieldSetMember> column;
    } 
}