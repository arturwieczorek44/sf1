public with sharing class ContactTriggerExpensesService {
    public static List<Account> CheckingIsTheirExpensesChange(Map<ID, Contact> newTrigger,Map<ID, Contact> oldTrigger, Map<ID, Account> accounts){
         System.debug('CheckingIsTheirExpensesChange');
         Map<ID, Contact> contactForNextStep=new Map<ID, Contact>();
        for(Contact contactNew:newTrigger.values()){
            if(contactNew.Expenses__c!=oldTrigger.get(contactNew.id).Expenses__c){
                System.debug('CheckingIsTheirExpensesChange if reached');
                contactForNextStep.put(contactNew.Id, contactNew);
            }
        }
        return preparingAccountsForUpdateAfterExpensesChange(accounts, contactForNextStep);
    
    }
    // //musisz zebrać Id accountów z CONTACTÓW które wpadły w trigger,
//  zapytać baze o Accounty i ich Contacty w jednej querzy po relacji tak jak zrobiłem to wcześniej z Contactami i Carami w komentarzu
//  i wtedy sie przepętlić i obliczyć to dodająć expense i uzupełnić pole wtedy dopiero,
//   pod tytułem Wallet, które będzie budżet - kwota która wyjdzie Ci z obliczeń
    
    
    public static List<Account> preparingAccountsForUpdateAfterExpensesChange(Map<ID, Account> accounts,Map<ID, Contact> contactForNextStep){
      List<Account> accountsWithContacts=[SELECT Id,Budget__c,Wallet__c,(SELECT Id, Expenses__c FROM Contacts)FROM Account WHERE Id IN :accounts.keySet()];
      List<Account> accountsForUpdate= new List<Account>();
        for(Account accountTemp: accountsWithContacts){
            System.debug('budget: ' + accountTemp.Budget__c);
            accountTemp.Wallet__c=accountTemp.Budget__c;
            System.debug('budget: ' + accountTemp.Wallet__c);
                for(Contact contactTemp : accountTemp.Contacts){
                    accountTemp.Wallet__c-=contactTemp.Expenses__c;
                    System.debug(contactTemp.Expenses__c);
                }   
            accountsForUpdate.add(accountTemp);
        }


        return accountsForUpdate;  
    }
        

                
}   


