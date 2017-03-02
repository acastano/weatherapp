
import Foundation

final class ForecastResponse: Response {
    
    var error: NSError?
    var forecast: [Weather]?
    
    fileprivate let city: City
    
    fileprivate let parser: ForecastParser
    
    init (city:City) {
    
        self.city = city
        
        parser = ForecastParserImpl()
        
    }
    
    func populateWithData(_ data: AnyObject?, error: NSError?) {

        self.error = error
        
        if self.error == nil {
            
            self.error = NSError(domain:ErrorDomain.forecast.rawValue, code:0, userInfo:nil)

            if let json = data as? [String:AnyObject], let jsonArray = json[ForecastAttributes.list.rawValue] as? [[String:AnyObject]] {
                
                forecast = parser.processForecast(city, jsonArray: jsonArray)
                
                self.error = nil
                
            }
            
        }
        
    }
    
}
