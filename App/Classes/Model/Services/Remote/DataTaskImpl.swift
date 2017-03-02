
import Foundation

final class DataTaskImpl: DataTask {
    
    func loadData(_ url:URL?, timeout:Double, completion:@escaping DataResponseErrorCompletion) {
        
        if let url = url {
     
            let configuration = URLSessionConfiguration.default
            
            configuration.requestCachePolicy = .useProtocolCachePolicy
            
            configuration.timeoutIntervalForRequest = timeout
            
            let session = URLSession(configuration:configuration, delegate:nil, delegateQueue:nil)
     
            let dataTask = session.dataTask(with: url, completionHandler:completion)
            
            dataTask.resume()
            
        } else {
            
            let error = NSError(domain:ErrorDomain.dataTask.rawValue, code:0, userInfo:nil)
            
            completion(nil, nil, error)
            
        }
        
    }
    
}
