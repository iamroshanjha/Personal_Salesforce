trigger orderTrigger on Order (before update) {
    system.debug('Here blanket order Service --');
        Map<String, Schema.SObjectField> orderFields = Schema.SObjectType.Order.fields.getMap();
    List<string> apiName = new List<String>{'statuscode','status'};
        system.debug('Api name -'+apiName);
        for(Order order: Trigger.new){
            Order oldOrder = (Order) Trigger.oldMap.get(order.Id);
            if(order.Status == 'Activated' || order.Status == 'Submitted to GP') {
                for(string s : orderFields.keyset()){
                    string res = (String) s;
                    if(oldOrder.get(res) != null && order.get(res) != oldOrder.get(res)){
                    system.debug('test'+order.get(res)+'--'+oldOrder.get(res) + '--res--'+res);
                    system.debug('check--'+order.get(res) != oldOrder.get(res));
                        system.debug('!apiName.contains(res)+'+!apiName.contains(res));
                        if(apiName.contains(res)==false){
                            system.debug('res-'+res);
                            system.debug('apiName-'+apiName);
                            order.addError('Field is not editable test');
                        }
                    }
                }
            }
        }
}