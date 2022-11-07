trigger CheckingGenderWhenContactCreatedTrigger on Contact (before insert) {
    
    new CheckingGenderWhenContactCreatedHandler().run();


        
    }
