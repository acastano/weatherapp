
import Foundation

class RemoteFailureImpl: NSObject, Remote {
    
    fileprivate let dataTask: DataTask
    
    required init(dataTask:DataTask, timeout:Double) {
    
        self.dataTask = dataTask
    
    }
    
    func makeRequest(_ request:RequestConfiguration, response:Response, completion:VoidCompletion?) {
        
        dataTask.loadData(nil, timeout: 0) { data, aResponse, error in
        
            response.populateWithData(nil, error: error as NSError?)
            
        }
        
        completion?()
        
    }
    
}
