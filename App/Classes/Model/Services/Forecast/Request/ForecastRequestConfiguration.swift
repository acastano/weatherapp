
import UIKit

class ForecastRequestConfiguration: RequestConfiguration {

    fileprivate let city: City
    fileprivate let requestHelper = RequestConfigurationHelper()
    
    init (city:City) {
        
        self.city = city
        
    }
    
    func url() -> URL? {
        
        return requestHelper.url(action(), method: method(), parameters: parameters())
        
    }

    func action() -> String {
        
        return ForecastActions.forecast.rawValue
        
    }
    
    func parameters() -> String {
     
        var parameters = requestHelper.parameters()
        
        parameters += "&\(CityAttributes.id.rawValue)=\(city.id)"
        
        parameters += "&\(CommonAttributes.units.rawValue)=\(Units.metric.rawValue)"

        return parameters
        
    }
    
    func method() -> RequestMethod {
        
        return .GET
    
    }

}
