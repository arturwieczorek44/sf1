public with sharing class CarTriggerUtility {
    public static void afterInsert(List<Car__c> cars){
        System.debug('utilitydebug');
        List<Contact> listOfChangedContacts= new List<Contact>();
        List<Contact> contacts = new List<Contact>();
        
        contacts= [SELECT Id,Expenses__c,LastAddedExpenseValue__c FROM Contact];

        for(Car__c	 car: cars){
            for(Contact contact: contacts){
                if(car.Contact__c==contact.id){
                    System.debug('Found Contact of Car');
                    contact.LastAddedExpenseValue__c= car.Price__c;
                    contact.Expenses__c+= car.Price__c;


                    listOfChangedContacts.add(contact);
                    }
            }
        }
    
        update listOfChangedContacts;
        System.debug('End CarTriggerUtility');
    

    }




    public static void beforeUpdate(List<Car__c> cars){
    






    }





    public static void beforeDelete(List<Car__c> cars){




    }
}
