public with sharing class CheckingGenderWhenContactCreatedHandler extends TriggerHandler {
    public override void beforeInsert(){
        CheckingGenderWhenContactCreatedUtility.detectGender(trigger.new);
      
    }



}