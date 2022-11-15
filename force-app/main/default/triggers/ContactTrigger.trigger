trigger ContactTrigger on Contact (after update, before insert) {
    
    new ContactTriggerHandler().run();
}