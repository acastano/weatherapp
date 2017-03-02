
final class Weather {

    var city: City
    var wind: Wind?
    var temp: Double
    var date: String?
    var temp_min: Double?
    var temp_max: Double?
    var details: Details?
    
    init (city: City, temp:Double) {
        
        self.city = city
        self.temp = temp
        
    }
    
}
