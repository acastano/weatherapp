
import Foundation

class DataTaskForecastSuccess: NSObject, DataTask {
    
    internal func loadData(_ url: URL?, timeout: Double, completion:@escaping DataResponseErrorCompletion) {
        
        let data = dataFromFile("forecast.json", bundle:Bundle(for: type(of: self)))
        
        completion(data, nil, nil)
        
    }
    
}
