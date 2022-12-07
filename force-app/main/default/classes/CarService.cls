@RestResource(urlMapping='/cars/*')
 global class CarService {
    @HttpGet
    global static List<Car__c> getCars(){
    //create a new instance for product object
    List<Car__c> prod = new List<Car__c>();
    RestRequest request = RestContext.request;
    //As params returns in Map<string, string> format and request the params
    String carId = request.requestURI.substring(request.requestURi.lastIndexOf('/')+1);
    System.debug('carId: '+carId);
    //It will get the Id passed from external system

    //Query the product record
    if(carId=='cars'){
        prod = [Select Id, Name,Value__C,Price__C From Car__c];

    }else{
        prod = [Select Id, Name,Value__C,Price__C From Car__c Where Id =: carId]; 
    
    }
    return prod;
    
    
    //return the product with that id
    
    }
    

    @HttpDelete
    global static String deleteCars(){
    //create a new instance for product object
    Car__c prod = new Car__c();
    //As params returns in Map<string, string> format and request the params
    Map<string, string> paramsMap = RestContext.request.params;
    //It will get the Id passed from external system
    string prodId = paramsMap.get('Id');
    //Query the product record
    prod = [Select Id, Name From Car__c Where Id =: prodId];
    //Delete the product from salesforce
    Delete prod;
    //return the String 
    return 'Product Deleted';
    }
    
    // @HttpPost
    // //Name and ProductCode will come from external system as a input
    // global static Car__c createProducts( String Name, String ProductCode){
    // //Create an instance of products
    // Car__c prod = new Car__c();
    // //Map the input params to name and productCode
    // prod.Name = Name;
    // //insert the product
    // insert prod;
    // //Return this product to the third party system as a response
    // return prod;  
    // }
    
    // @HttpPut
    // //Name and ProductCode will come from external system as a input
    // global static Car__c updateProducts( String Name, String ProductCode){
    // //As params returns in Map<string, string> format and request the params
    // Map<string, string> paramsMap = RestContext.request.params;
    // //It will get the Id passed from external system
    // string prodId = paramsMap.get('Id');
    // //Create an instance of products
    // Car__c prod = new Car__c();
    // //Map the input params to Id, name and productCode 
    // prod.Id = prodId;
    // prod.Name = Name;

    // //insert the product
    // update prod;
    // //Return this product to the third party system as a response
    // return prod;  
    // }  
}