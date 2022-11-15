public with sharing class ContactTriggerUtility {


    public static void afterUpdateWhenBudgetMustBeChanged(List<Contact> newTrigger,List<Contact> oldTrigger){
System.debug('acccountcontact');



       List<Account> allAccounts = [SELECT Id,Budget__c FROM Account];
        List<Account> accountsForUpdate= new List<Account>();
        List<Contact> contactForNextStep= new List<Contact>();
System.debug('listanew'+newTrigger);
System.debug('listaold'+oldTrigger);

        for(Contact contactNew:newTrigger){
            for(Contact contactOld:oldTrigger){
                System.debug('1');
                if(contactNew.Expenses__c!=contactOld.Expenses__c){
                    System.debug('2');
                    System.debug(contactNew.Expenses__c);
                    System.debug(contactOld.Expenses__c);
                    System.debug(contactNew.LastAddedExpenseValue__c);
                    System.debug(contactNew.LastAddedExpenseValue__c);
                    contactForNextStep.add(contactNew);
                }
            }
        }
        

           for(Account account: allAccounts){
                for(Contact contact:contactForNextStep){
                    if(contact.AccountId==account.id){
                        account.Budget__c-=contact.LastAddedExpenseValue__c;
                        accountsForUpdate.add(account);
                    }
                }
           }
           update accountsForUpdate;
            
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
