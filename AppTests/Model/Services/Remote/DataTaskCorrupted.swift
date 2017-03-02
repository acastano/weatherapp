
import Foundation

class DataTaskCorrupted: NSObject, DataTask {
    
    internal func loadData(_ url: URL?, timeout: Double, completion:@escaping DataResponseErrorCompletion) {
        
        let data = dataFromFile("weathercorrupted.json", bundle:Bundle(for: type(of: self)))
        
        completion(data, nil, nil)
        
    }
    
}
