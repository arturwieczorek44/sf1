public class carGetJsonHandler {
  
    
    List<CarsWrapper.Cars> carsFromJson= new List<CarsWrapper.Cars>();

    @AuraEnabled(cacheable =true)
    public static List<CarsWrapper.Cars>  getJsonHandler() {
        System.debug('12345');
        List<CarsWrapper.Cars> carsFromJson= new List<CarsWrapper.Cars>();
        Http httpCallout = new Http();
        HttpRequest req= new HttpRequest();
        req.setEndpoint('https://myfakeapi.com/api/cars');
        req.setMethod('GET');
        HttpResponse response = httpCallout.send(req);
        CarsWrapper carApi = CarsWrapper.parse(response.getBody());
        carsFromJson=carApi.cars;
        System.debug(carsFromJson);
        List<CarsWrapper.Cars> carsForDisplay = new List<CarsWrapper.Cars>();
        for(integer i=0;i<15;i++){
            carsForDisplay.add(carsFromJson.get(i));

        }
        return carsForDisplay;
    }
    

}