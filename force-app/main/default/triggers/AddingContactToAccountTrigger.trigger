trigger AddingContactToAccountTrigger on Account (after insert) {

new AddingContactToAccountTriggerHandler().run();
    }
    