
import Foundation

final class ForecastParserImpl: ForecastParser {
    
    fileprivate let weatherParser: WeatherParser
    
    init () {
        
        weatherParser = WeatherParserImpl()
        
    }
    
    func processForecast(_ city:City, jsonArray: [[String:AnyObject]]) -> [Weather] {
        
        var list = [Weather]()
        
        for json in jsonArray {
        
            if let main = json[WeatherAttributes.main.rawValue] as? [String:AnyObject],
                let temp = main[MainAttributes.temp.rawValue] as? Double {
            
                let weather = weatherParser.processWeather(city, temperature: temp, json: json)
                
                list.append(weather)
                
            }
            
        }
        
        return list
        
    }

}
