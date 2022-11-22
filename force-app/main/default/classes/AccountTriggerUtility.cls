public with sharing class AccountTriggerUtility {
  


    public static void insertContactsUnderAccounts(List<Account> accounts){
        List<Contact> contactsList=  new List<Contact>();
        For(Account account:accounts){
           contactsList.add(new Contact( FirstName=account.Name, LastName='testLastName',AccountId=account.Id));
            
            
        } 
    insert contactsList;



  

    }

}