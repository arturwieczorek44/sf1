public with sharing class CheckingGenderWhenContactCreatedHandler {
   
    public static void checkingGender(List<Contact> contacts){

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