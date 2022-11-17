public with sharing class ContactTriggerUtility {



    public static void afterUpdate(List<Contact> newTrigger,List<Contact> oldTrigger){
        System.debug('ContactTriggerUtility main class reached');
        
        List<Account> allAccounts = [SELECT Id,Budget__c,Wallet__c,NumberOfBoughtCars__c FROM Account];
        List<Account> accountsForUpdate=CheckingIsTheirExpensesChange(newTrigger,oldTrigger,allAccounts);
        accountsForUpdate.addAll( CheckingIsTheirProfitChange(newTrigger,oldTrigger,allAccounts));
        
       
        
        update accountsForUpdate;

    }
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
  


        public static void beforeInsert(List<Contact> contacts){
            detectGender(contacts);
    
    
        }

    public static void  detectGender(List<Contact> contacts){


        For(Contact contact:contacts){

            if(checkLastChar(contact.FirstName)==true){
                contact.Gender__c='female';
                }
            else
                {
                contact.Gender__c='male';
                }
            System.Debug(contact.Gender__c);
        }
    }
    
    
        public static Boolean checkLastChar(String firstName){
            String toCheck = firstName;
        
            if(toCheck.substring(toCheck.length() - 1)=='a')
                {
                return true;
                }
                else
                {
                return false;
                }
        }

}     
