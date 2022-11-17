public with sharing class ContactTriggerProfitService {
    public static List<Account> CheckingIsTheirProfitChange(List<Contact> newTrigger,Map<ID, Contact> oldTrigger,Map<ID, Account> allAccounts){
        List<Contact> contactForNextStep=new List<Contact>();
        for(Contact contactNew:newTrigger){
            if(contactNew.Profit__c!=oldTrigger.get(contactNew.id).Profit__c){
                System.debug('CheckingIsTheirExpensesChange if reached');
                contactForNextStep.add(contactNew);   
        }
    }
   return preparingAccountsForUpdateAfterProfitChange(allAccounts, contactForNextStep);
}

    public static List<Account> preparingAccountsForUpdateAfterProfitChange(Map<ID, Account>allAccounts,List<Contact> contactForNextStep){
        System.debug('preparingAccountsForUpdate');
        List<Account> accountsForUpdate=new List<Account>();
        for(Contact contact:contactForNextStep){
            Account account= allAccounts.get(contact.accountId);       
            System.debug('preparingAccountsForUpdate s for reached');
            account.Wallet__c+=contact.LastGainedProfit__c;
            accountsForUpdate.add(account);
        }
        return accountsForUpdate;    
    }
}
