trigger CheckingGenderWhenContactCreatedTrigger on Contact (before insert) {
    
    CheckingGenderWhenContactCreatedHandler.checkingGender(Trigger.new);


        
    }
