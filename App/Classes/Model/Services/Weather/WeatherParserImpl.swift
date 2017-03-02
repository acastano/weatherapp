
import Foundation

final class WeatherParserImpl: WeatherParser {
    
    func processWeather(_ city:City, temperature:Double, json: [String : AnyObject]) -> Weather {
        
        let instance = Weather(city:city, temp: temperature)
        
        instance.date = json[WeatherAttributes.dt_txt.rawValue] as? String
                
        if let main = json[WeatherAttributes.main.rawValue] as? [String : AnyObject] {
            
            processMain(instance, json:main)
            
        }

        if let wind = json[WeatherAttributes.wind.rawValue] as? [String : AnyObject] {
            
            instance.wind = processWind(wind)
            
        }

        if let details = json[WeatherAttributes.weather.rawValue] as? [[String : AnyObject]] {
            
            instance.details = processDetails(details)
            
        }
        
        return instance
        
    }
    
    fileprivate func processWind(_ json:[String : AnyObject]) -> Wind? {
        
        let instance = Wind()
        
        instance.speed = json[WindAttributes.speed.rawValue] as? Double
        
        return instance
        
    }
    
    fileprivate func processMain(_ weather:Weather, json:[String : AnyObject]) {
        
        weather.temp_min = json[MainAttributes.temp_min.rawValue] as? Double
        weather.temp_max = json[MainAttributes.temp_max.rawValue] as? Double
        
    }
    
    fileprivate func processDetails(_ jsonArray:[[String : AnyObject]]) -> Details? {
        
        var instance: Details?
        
        if jsonArray.count > 0,
            let description = jsonArray[0][DetailsAttributes.description.rawValue] as? String, description.characters.count > 0 {
            
            instance = Details()
            
            instance?.description = jsonArray[0][DetailsAttributes.description.rawValue] as? String
            
        }
        
        return instance
        
    }
    
}
