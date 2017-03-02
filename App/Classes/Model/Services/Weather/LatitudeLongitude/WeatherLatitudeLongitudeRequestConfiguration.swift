
import Foundation

final class WeatherLatitudeLongitudeRequestConfiguration: RequestConfiguration {
    
    fileprivate let latitude: Double
    fileprivate let longitude: Double
    fileprivate var helper: RequestConfigurationHelper
    
    init(latitude:Double, longitude:Double) {
        
        self.latitude = latitude
        
        self.longitude = longitude
        
        helper = RequestConfigurationHelper()
    
    }
    
    func action() -> String {
        
        let action = WeatherActions.weather.rawValue

        return action
        
    }
 
    func parameters() -> String {
        
        var params = helper.parameters()
        
        params += "&\(WeatherLatitudeLongitudeAttributes.latitude.rawValue)=\(latitude)"
        params += "&\(WeatherLatitudeLongitudeAttributes.longitude.rawValue)=\(longitude)"
        params += "&\(CommonAttributes.units.rawValue)=\(Units.metric.rawValue)"

        return params
        
    }
    
    func method() -> RequestMethod {
        
        return .GET
        
    }
   
    func url() -> URL? {
        
        let url = helper.url(action(), method: method(), parameters: parameters())
        
        return url
        
    }
    
}
