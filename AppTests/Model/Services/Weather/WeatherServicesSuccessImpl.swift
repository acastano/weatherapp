
import Foundation

final class WeatherServicesSuccessImpl: WeatherServices {

    func temperature(_ term:String?, completion:WeatherErrorCompletion?) {
        
        completion?(weather(), nil)
        
    }
    
    func temperature(_ latitude:Double, longitude:Double, completion:WeatherErrorCompletion?) {
    
        completion?(weather(), nil)
        
    }
    
    fileprivate func weather() -> Weather {
        
        let city = City(id:1, name: "Name")
        
        let instance = Weather(city:city, temp: 30)
        
        let details = Details()
        
        details.description = "details"
        
        instance.details = details
        
        instance.temp_max = 32
        instance.temp_min = 28
        
        let wind = Wind()
        
        wind.speed = 10
        
        instance.wind = wind
        
        return instance
        
    }
    
}
