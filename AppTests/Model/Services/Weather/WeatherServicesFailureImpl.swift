
import Foundation

final class WeatherServicesFailureImpl: WeatherServices {

    func temperature(_ term:String?, completion:WeatherErrorCompletion?) {

        let error = NSError(domain: "", code:0, userInfo: nil)
        
        completion?(nil, error)
        
    }
    
    func temperature(_ latitude:Double, longitude:Double, completion:WeatherErrorCompletion?) {
    
        let error = NSError(domain: "", code:0, userInfo: nil)
        
        completion?(nil, error)
        
    }
    
}
