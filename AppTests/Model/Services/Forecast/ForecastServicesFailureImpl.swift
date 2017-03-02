
import Foundation

final class ForecastServicesFailureImpl: ForecastServices {

    func forecast(_ city:City, completion:@escaping ForecastErrorCompletion) {

        let error = NSError(domain: "", code:0, userInfo: nil)
        
        completion(nil, error)
        
    }
    
}
