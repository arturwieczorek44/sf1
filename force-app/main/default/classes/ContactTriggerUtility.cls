public with sharing class ContactTriggerUtility {
 



    public static void updateAccountWhenContactChanged(Map<ID, Contact> newTrigger, Map<ID, Contact> oldTrigger){
        System.debug('ContactTriggerUtility main class reached');
        Set<Id> accountIds = new Set<Id>();
            for(Contact contact: newTrigger.values()){
                accountIds.add(contact.AccountId);
            }

        
            Map<Id, Account> accountsMap = new Map<Id,Account>([SELECT Id FROM account  WHERE Id IN: accountIds]);
             //Map<Id, Account> accountsMap = new Map<Id,Account>([select id from account where ...]);

            Map<ID, Contact> contactsPreparedForChange=CheckingIsTheirExpensesChange(newTrigger,oldTrigger);

        List<Account> accountsForUpdate=  preparingAccountsForUpdateAfterExpensesChange(accountsMap,contactsPreparedForChange);



       // accountsForUpdate.addAll(ContactTriggerProfitService.CheckingIsTheirProfitChange(newTrigger,oldTrigger,accountsMap));
        update accountsForUpdate;
    }


    public static  Map<ID, Contact> CheckingIsTheirExpensesChange(Map<ID, Contact> newTrigger,Map<ID, Contact> oldTrigger){
        System.debug('CheckingIsTheirExpensesChange');
        Map<ID, Contact> contactForNextStep=new Map<ID, Contact>();
        for(Contact contactNew:newTrigger.values()){
           if(contactNew.Expenses__c!=oldTrigger.get(contactNew.id).Expenses__c){
               System.debug('CheckingIsTheirExpensesChange if reached');
               contactForNextStep.put(contactNew.Id, contactNew);
           }
       }
       return contactForNextStep;
   
   }
   // //musisz zebrać Id accountów z CONTACTÓW które wpadły w trigger,
//  zapytać baze o Accounty i ich Contacty w jednej querzy po relacji tak jak zrobiłem to wcześniej z Contactami i Carami w komentarzu
//  i wtedy sie przepętlić i obliczyć to dodająć expense i uzupełnić pole wtedy dopiero,
//   pod tytułem Wallet, które będzie budżet - kwota która wyjdzie Ci z obliczeń
   
   
   public static List<Account> preparingAccountsForUpdateAfterExpensesChange(Map<ID, Account> accounts,     Map<ID, Contact> contactForNextStep){
        List<Account> accountsWithContacts = [SELECT Id,Budget__c,Wallet__c,(SELECT Id, Expenses__c FROM Contacts)FROM Account WHERE Id IN :accounts.keySet()];
        List<Account> accountsForUpdate = new List<Account>();

        for(Account accountTemp: accountsWithContacts){
           System.debug('budget: ' + accountTemp.Budget__c);
           accountTemp.Wallet__c = accountTemp.Budget__c;
           System.debug('budget: ' + accountTemp.Wallet__c);
               for(Contact contactTemp : accountTemp.Contacts){
                   accountTemp.Wallet__c -= contactTemp.Expenses__c;
                   System.debug(contactTemp.Expenses__c);
               }   
           accountsForUpdate.add(accountTemp);
       }

       return accountsForUpdate;  

   }


    public static void  checkGender(List<Contact> contacts){

        For(Contact contact:contacts){

            if(checkLastChar(contact.FirstName) == true){
                contact.Gender__c = 'female';
            }else{
                contact.Gender__c = 'male';
                }
            System.Debug(contact.Gender__c);
        }
    }
    
        public static Boolean checkLastChar(String firstName){
            String toCheck = firstName;
            if(toCheck.substring(toCheck.length() - 1) == 'a')
                {
                return true;
                }else{
                return false;
                }
        }



}     
