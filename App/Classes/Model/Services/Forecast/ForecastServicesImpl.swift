
import Foundation

final class ForecastServicesImpl: ForecastServices {
    
    fileprivate let remote: Remote
    
    init (remote: Remote) {
        
        self.remote = remote
        
    }
    
    func forecast(_ city: City, completion: @escaping ForecastErrorCompletion) {
        
        let request = ForecastRequestConfiguration(city: city)
        
        let response = ForecastResponse(city: city)
        
        remote.makeRequest(request, response: response) { 
            
            completion(response.forecast, response.error)
            
        }
        
    }
    
}
