
import Foundation

class DataTaskFailure: DataTask {
    
    func loadData(_ url: URL?, timeout: Double, completion:@escaping DataResponseErrorCompletion) {
        
        let error = NSError(domain: "error", code: 1, userInfo: nil)
        
        completion(nil, nil, error)
        
    }
    
}
