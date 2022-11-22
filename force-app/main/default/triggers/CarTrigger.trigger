trigger CarTrigger on Car__c (after insert, after delete, after update) {

    System.debug('trigerdebur');
    new CarTriggerHandler().run();


}