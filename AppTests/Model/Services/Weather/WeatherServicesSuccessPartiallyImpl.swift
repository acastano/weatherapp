
import Foundation

final class WeatherServicesSuccessPartiallyImpl: WeatherServices {

    func temperature(_ term:String?, completion:WeatherErrorCompletion?) {
        
        completion?(weather(), nil)
        
    }
    
    func temperature(_ latitude:Double, longitude:Double, completion:WeatherErrorCompletion?) {
    
        completion?(weather(), nil)
        
    }
    
    fileprivate func weather() -> Weather {
        
        let city = City(id:1, name: "Name")
        
        let instance = Weather(city:city, temp: 30)
        
        return instance
        
    }
    
}
