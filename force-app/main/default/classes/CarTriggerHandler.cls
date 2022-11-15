public with sharing class CarTriggerHandler extends TriggerHandler {
    public override void afterInsert(){
        System.debug('handlerdebug');
           CarTriggerUtility.afterInsert(trigger.new);
    }

    public override void beforeUpdate(){
        CarTriggerUtility.beforeUpdate(trigger.new);
    }

     public override void beforeDelete(){
        CarTriggerUtility.beforeDelete(trigger.new);
    }


        
}
