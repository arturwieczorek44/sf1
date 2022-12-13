public with sharing class CarTriggerHandler extends TriggerHandler {
    public override void afterInsert(){
        System.debug('handlerdebug');
        CarTriggerUtility.updatingContactExpenses(trigger.new);
    }


    public override void afterUpdate(){
        System.debug('handlerdebug');
        CarTriggerUtility.checkingIsThereDifferenceBettweenPrices(trigger.old, (Map<ID, Car__c>)trigger.newMap);
    }



     public override void afterDelete(){
        CarTriggerUtility.updatingContactExpenses(trigger.old);
    }


        
}
