public with sharing class ContactTriggerHandler extends TriggerHandler {
    public override void beforeInsert(){
        ContactTriggerUtility.CheckGender(trigger.new);
      
    }

    public override void afterUpdate(){
        
        ContactTriggerUtility.updateAccountWhenContactChanged((Map<ID, Contact>)trigger.newMap,(Map<ID, Contact>)trigger.oldMap);
      
    }
}
