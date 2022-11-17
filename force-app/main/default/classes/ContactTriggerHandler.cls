public with sharing class ContactTriggerHandler extends TriggerHandler {
    public override void beforeInsert(){
        ContactTriggerUtility.beforeInsert(trigger.new);
      
    }

    public override void afterUpdate(){
        
        ContactTriggerUtility.afterUpdate(trigger.new,trigger.old);
      
    




}
}
