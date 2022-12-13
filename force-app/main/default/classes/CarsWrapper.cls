public class CarsWrapper {

	public class Cars {
        @AuraEnabled
		public Integer id;
        @AuraEnabled
        public String car;
        @AuraEnabled
        public String car_model;
        @AuraEnabled
        public String car_color;
        @AuraEnabled
        public Integer car_model_year;
        @AuraEnabled
        public String car_vin;
        @AuraEnabled
        public String price;
        @AuraEnabled
		public Boolean availability;
	}
        @AuraEnabled
		public List<Cars> cars;
	

	
	public static CarsWrapper parse(String json) {
		return (CarsWrapper) System.JSON.deserialize(json, CarsWrapper.class);
	}
}