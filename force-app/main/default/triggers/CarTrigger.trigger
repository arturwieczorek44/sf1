trigger CarTrigger on Car__c (after insert, before delete, before update) {

    System.debug('trigerdebur');
    new CarTriggerHandler().run();


}