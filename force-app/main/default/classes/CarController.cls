public with sharing class CarController {

    @AuraEnabled(cacheable=true)
    public static List<Car__c> getCarList(String recordId) {
        System.debug('id:'+recordId);

        return [    

            SELECT Name, Value__c, Price__c
            FROM Car__c
            WHERE Contact__r.AccountId = :recordId
            
        ];
    }
///////////
}

