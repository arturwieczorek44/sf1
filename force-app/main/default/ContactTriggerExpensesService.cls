public with sharing class ContactTriggerExpensesService {
    public static List<Account> CheckingIsTheirExpensesChange(List<Contact> newTrigger,List<Contact> oldTrigger,List<Account> allAccounts){
         System.debug('CheckingIsTheirExpensesChange');
        List<Contact> contactForNextStep=new List<Contact>();
        for(Contact contactNew:newTrigger){
            for(Contact contactOld:oldTrigger){
    
                if(contactNew.Expenses__c!=contactOld.Expenses__c){
                    System.debug('CheckingIsTheirExpensesChange if reached');
                    contactForNextStep.add(contactNew);
                }
            }
        }
        return preparingAccountsForUpdateAfterExpensesChange(allAccounts, contactForNextStep);
    
    }
    
    
    public static List<Account> preparingAccountsForUpdateAfterExpensesChange(List<Account> allAccounts,List<Contact> contactForNextStep){
        System.debug('preparingAccountsForUpdate');
        List<Account> accountsForUpdate=new List<Account>();
             for(Account account: allAccounts){
                for(Contact contact:contactForNextStep){
                     if(contact.AccountId==account.id){
                        if(account.NumberOfBoughtCars__c==0){
                            System.debug('Number of BoughtCars is 0 before trigger');
                             account.Wallet__c=account.Budget__c;
                          }
                        System.debug('preparingAccountsForUpdate s for reached');
                        account.Wallet__c-=contact.LastAddedExpenseValue__c;
                        account.NumberOfBoughtCars__c++;
                        accountsForUpdate.add(account);
                        }   
                }
            }
            return accountsForUpdate;
                
    }   

}
