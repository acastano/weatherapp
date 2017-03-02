
import Foundation

final class WeatherServicesImpl: WeatherServices {
    
    fileprivate let remote: Remote
    
    init (remote: Remote) {
        
        self.remote = remote
        
    }
    
    func temperature(_ term:String?, completion:WeatherErrorCompletion?) {

        let request = WeatherSearchRequestConfiguration(term:term)
        
        let response = WeatherResponse()
        
        remote.makeRequest(request, response: response) { 
            
            completion?(response.weather, response.error)
            
        }
        
    }
    
    func temperature(_ latitude:Double, longitude:Double, completion:WeatherErrorCompletion?) {
    
        let request = WeatherLatitudeLongitudeRequestConfiguration(latitude: latitude, longitude: longitude)
        
        let response = WeatherResponse()
        
        remote.makeRequest(request, response: response) {
            
            completion?(response.weather, response.error)
            
        }
        
    }
    
}
