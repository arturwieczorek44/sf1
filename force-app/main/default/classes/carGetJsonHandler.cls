public class carGetJsonHandler {
	//public static List<wrapperCls> result{get;set;}
    
//     public static dt_tracker(){
//     String recordstring = getJsonFromHttp();
//     result = (List<wrapperCls>) JSON.deserialize(recordstring, List<wrapperCls>.class);
//     }
//     class wrapperCls {
//     public string Id {get;set;}
//     public string car {get;set;}
//     public string car_color_model {get;set;}
//     public string car_model_year {get;set;}
//     public string car_vin {get;set;}
//     public string price {get;set;}
//     public string availability {get;set;}
// }
    @AuraEnabled(cacheable =true)
    public static string getJsonHandler() {
        HttpRequest request = new HttpRequest();
        request.setEndPoint('https://myfakeapi.com/api/cars/');
        request.setHeader('Contetnt-Type', 'application/json');
        String endPoint = request.getEndPoint();
        System.debug(endpoint); //http://www.salesforcekid.com
        request.setMethod('GET');
        Http http = new http();
        HttpResponse send = http.send(request);
        String response =  send.getStatus();
        System.debug('respone: '+response);
         return response;
        
    }
    //public string Id {get;set;}
    // public string car {get;set;}
    // public string car_color_model {get;set;}
    // public string car_model_year {get;set;}
    // public string car_vin {get;set;}
    // public string price {get;set;}
    // public string availability {get;set;}

}