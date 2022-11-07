public with sharing class AddingContactToAccountTriggerHandler extends TriggerHandler{
    public override void afterInsert(){
        AddingContactToAccountUtility.addContact(trigger.new);
    }



}



