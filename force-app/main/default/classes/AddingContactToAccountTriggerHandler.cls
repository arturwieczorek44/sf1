public with sharing class AddingContactToAccountTriggerHandler {
    public static void adding(List<Account> a) {
For(Account account:a){
    Contact contact=new Contact( FirstName='testName', LastName='testLastName',AccountId=account.Id);

System.Debug(contact.AccountId +' =? ' + account.Id);
insert(contact);


    
    }



}

                       
}





