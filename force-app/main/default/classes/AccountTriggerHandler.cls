public with sharing class AccountTriggerHandler  extends TriggerHandler{
    public override void afterInsert(){
        AccountTriggerUtility.insertContactsUnderAccounts(trigger.new);
    }

 

}