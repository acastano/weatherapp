
import Foundation

final class WeatherResponse: Response {

    var error: NSError?
    var weather: Weather?
    
    fileprivate let parser: WeatherParser
    
    init () {
                
        parser = WeatherParserImpl()
        
    }
    
    func populateWithData(_ data:AnyObject?, error: NSError?) {
        
        self.error = error
        
        if self.error == nil {
            
            self.error = NSError(domain:ErrorDomain.weather.rawValue, code:0, userInfo:nil)

            if let json = data as? [String:AnyObject],
                let id = json[CityAttributes.id.rawValue] as? Int,
                let name = json[CityAttributes.name.rawValue] as? String,
                let main = json[WeatherAttributes.main.rawValue] as? [String:AnyObject],
                let temp = main[MainAttributes.temp.rawValue] as? Double {
            
                let city = City(id: id, name: name)
                
                weather = parser.processWeather(city, temperature:temp, json: json)
              
                self.error = nil
                
            }
            
        }
        
    }
    
}
