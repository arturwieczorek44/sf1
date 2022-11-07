trigger AddingContactToAccountTrigger on Account (after insert) {

AddingContactToAccountTriggerHandler.adding(Trigger.new);
    }
    