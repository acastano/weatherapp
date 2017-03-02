
import Foundation

final class ForecastServicesSuccessImpl: ForecastServices {

    func forecast(_ city:City, completion:@escaping ForecastErrorCompletion) {
        
        completion([weather()], nil)
        
    }
    
    fileprivate func weather() -> Weather {
        
        let city = City(id:1, name: "Name")
        
        let instance = Weather(city:city, temp: 30)
        
        let details = Details()
        
        details.description = "details"
        
        instance.details = details
        
        instance.temp_max = 32
        instance.temp_min = 28
        
        instance.date = "2016-06-20 00:00:00"
        
        let wind = Wind()
        
        wind.speed = 10
        
        instance.wind = wind
        
        return instance
        
    }
    
}
