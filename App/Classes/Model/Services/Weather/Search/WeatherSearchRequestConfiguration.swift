
import Foundation

final class WeatherSearchRequestConfiguration: RequestConfiguration {
    
    fileprivate let term: String?
    fileprivate let helper = RequestConfigurationHelper()
    
    init(term:String?) {
        
        self.term = term
    
    }
 
    func url() -> URL? {
        
        let url = helper.url(action(), method: method(), parameters: parameters())
        
        return url
    
    }
    
    func parameters() -> String {
        
        var params = helper.parameters()
        
        if let term = term {
        
            params += "&\(WeatherSearchAttributes.q.rawValue)=\(term)"
            params += "&\(CommonAttributes.units.rawValue)=\(Units.metric.rawValue)"

        }
        
        return params
        
    }
    
    func action() -> String {
        
        return WeatherActions.weather.rawValue
        
    }
    
    func method() -> RequestMethod {
        
        return .GET
        
    }

}
