
import Foundation

typealias ForecastErrorCompletion = ([Weather]?, NSError?) -> ()

protocol ForecastServices {
    
    func forecast(_ city:City, completion:@escaping ForecastErrorCompletion)
    
}
