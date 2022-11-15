public with sharing class AccountTriggerHandler  extends TriggerHandler{
    public override void afterInsert(){
        AccountTriggerUtility.afterInsert(trigger.new);
    }

    public override void afterUpdate(){
        AccountTriggerUtility.afterUpdate(trigger.new);
    }

}