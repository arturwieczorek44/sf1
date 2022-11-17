public  with sharing class AddingContactToAccountUtility {
    public static void addContact(List<Account> accounts){
            For(Account account:accounts){
                Contact contact=new Contact( FirstName=account.Name, LastName='testLastName',AccountId=account.Id);

                System.Debug(contact.AccountId +' =? ' + account.Id);
                insert(contact);
            } 
        }


    }

