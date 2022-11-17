public with sharing class AccountTriggerUtility {
  
        public static void afterUpdate(List<Account> accounts){

  

    }

    public static void afterInsert(List<Account> accounts){
        List<Contact> contactsList=  new List<Contact>();
        For(Account account:accounts){
           contactsList.add(new Contact( FirstName=account.Name, LastName='testLastName',AccountId=account.Id));
            
            
        } 
insert contactsList;



  

    }

}