public with sharing class CarTriggerUtility {

    public static void checkingIsThereDifferenceBettweenPrices(List<Car__c> oldCars, Map<ID, Car__c>newCars){
        List<Car__c> carsWithChangedPrice = new List<Car__c>();
        for(Car__c oldCar:oldCars){
            if(oldCar.Price__c != newCars.get(oldCar.Id).Price__c){
                carsWithChangedPrice.add(newCars.get(oldCar.Id));
            }
        }
        updatingContactExpenses(carsWithChangedPrice);

    }



    public static void updatingContactExpenses(List<Car__c> cars){
        System.debug('utilitydebug');
      List<Contact> contactsToUpdate = new List<Contact>();

        Set<Id> contactIds = new Set<Id>();
        for(Car__c car: cars) {
            contactIds.add(car.contact__c);
        }

        List<Contact> contactsWithCars = [SELECT Id, Expenses__c, (SELECT Id, Price__c FROM Cars__r) FROM Contact WHERE Id IN :contactIds];
System.debug('cwc: '+contactsWithCars);
        for(Contact contactTemp : contactsWithCars) {
            Double newContactExpenses = 0;
            for(Car__c carTemp : contactTemp.Cars__r) {
                System.debug('car expenses: '+ carTemp.Price__c );
                System.debug('newContactExpenses: '+ carTemp.Price__c );
                newContactExpenses += carTemp.Price__c;
            }

            if(newContactExpenses != contactTemp.Expenses__c) {
                contactTemp.Expenses__c = newContactExpenses;
                contactsToUpdate.add(contactTemp);
                }
        }
        if(!contactsToUpdate.isEmpty()) {
            update contactsToUpdate;
            }

     
        System.debug('End CarTriggerUtility');
    

    }
    
    public static void gainingProfitAfterSelling(List<Car__c> cars){
//         System.debug('Trying to delete car');
//         List<Contact> listOfChangedContacts= new List<Contact>();
//         List<Contact> contacts = new List<Contact>();
        
//         contacts= [SELECT Id,Expenses__c,LastGainedProfit__c,Profit__c FROM Contact];
// System.debug('before running loops');

//         for(Car__c	 car: cars){
//             for(Contact contact: contacts){
//                 if(car.Contact__c==contact.id){
//                     System.debug('Found Contact of Car');
//                     contact.LastGainedProfit__c= car.Value__c;
//                     contact.Profit__c	+= car.Value__c;
//                     listOfChangedContacts.add(contact);
//                     }
//             }
//         }
    
//         update listOfChangedContacts;
//         System.debug('End CarTriggerUtility');
    

    }


      





     
}
