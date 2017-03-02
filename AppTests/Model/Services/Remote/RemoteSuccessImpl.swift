
import Foundation

class RemoteSuccessImpl: NSObject, Remote {
    
    fileprivate let dataTask: DataTask
    
    required init(dataTask:DataTask, timeout:Double) {
    
        self.dataTask = dataTask
        
    }
    
    func makeRequest(_ request:RequestConfiguration, response:Response, completion:VoidCompletion?) {
        
        dataTask.loadData(nil, timeout: 0) { data, aResponse, error in
        
            if let data = data {
                
                var responseData: Any?
                
                do {
                    
                    responseData = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                    
                } catch {}
                
                
                if let json = responseData as? [String:AnyObject] {
                    
                    response.populateWithData(json as AnyObject?, error: nil)
                    
                }
                
            }
            
            completion?()
        }
        
    }
    
}
