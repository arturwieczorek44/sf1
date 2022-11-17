public with sharing class ContactTriggerProfitService {
    public static List<Account> CheckingIsTheirProfitChange(List<Contact> newTrigger,List<Contact> oldTrigger,List<Account> allAccounts){
        List<Contact> contactForNextStep=new List<Contact>();
        for(Contact contactNew:newTrigger){
            for(Contact contactOld:oldTrigger){
            if(contactNew.Profit__c!=contactOld.Profit__c){
                System.debug('CheckingIsTheirExpensesChange if reached');
                contactForNextStep.add(contactNew);
            }
        }
      
    }
   return preparingAccountsForUpdateAfterProfitChange(allAccounts, contactForNextStep);
}
    public static List<Account> preparingAccountsForUpdateAfterProfitChange(List<Account> allAccounts,List<Contact> contactForNextStep){
        System.debug('preparingAccountsForUpdate');
        List<Account> accountsForUpdate=new List<Account>();
           for(Account account: allAccounts){
                for(Contact contact:contactForNextStep){
                    if(contact.AccountId==account.id){
                     
                        System.debug('preparingAccountsForUpdate s for reached');
                        account.Wallet__c+=contact.LastGainedProfit__c;
                        accountsForUpdate.add(account);
                    }
                }
           }
           return accountsForUpdate;


    }
}
