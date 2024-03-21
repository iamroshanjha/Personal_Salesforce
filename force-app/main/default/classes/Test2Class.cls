public class Test2Class {
    
    public static void main(Integer key){
        
        /*List<String> data = new lIst<String>();
        data.add('abcd');
        data.add('data');
        data.add('data');
        data.add('abcd');
        Set<String> dataSet = new set<String>();
          
        data.addAll(dataSet);
        
        dataSet.addAll(data);
        system.debug(dataSet);
        */
        map<Integer,String> mapData = new map<Integer,String>();
        
        mapData.put(1,'Antara');
        
        mapData.put(2,'Tanmay');
       
        
        if(mapData.containsKey(key))
        {
           System.debug('Key Exist');
        }
        else
        {
            mapData.put(key,'Roshan'); 
        }
        
        System.debug(mapData);
        
        String mapGet =  mapData.get(key);
        System.debug(mapGet);
         System.debug(mapData.keySet());
         System.debug(mapData.values());
        System.debug(mapData.toString());
        
        
        
       
    }
}