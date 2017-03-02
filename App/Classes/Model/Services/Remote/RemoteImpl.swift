
import Foundation

final class RemoteImpl: NSObject, Remote {
    
    fileprivate let timeout: Double
    fileprivate let dataTask: DataTask
    
    required init(dataTask:DataTask, timeout:Double) {
        
        self.timeout = timeout
        
        self.dataTask = dataTask
        
    }
    
    func makeRequest(_ request:RequestConfiguration, response:Response, completion:VoidCompletion?) {
        
        dataTask.loadData(request.url(), timeout:timeout) { data, urlResponse, error in
            
            let dataError = self.processResponse(data, response: urlResponse, error: error)
            
            response.populateWithData(dataError.0, error:dataError.1)
            
            self.runOnMainThread() {
                
                completion?()
                
            }

        }
        
    }
    
    //MARK: - Helpers
    
    fileprivate func processResponse(_ data:Data?, response:URLResponse?, error:Error?) -> (AnyObject?, NSError?) {
        
        var returnError = error
        
        var responseData: Any?
        
        if let data = data, error == nil {
            
            var parsingError: NSError?
            
            do {
                
                responseData = try JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                
            } catch let error as NSError {
                
                parsingError = error
                
                responseData = nil
                
            }
            
            if parsingError != nil {
                
                returnError = parsingError
                
            }
            
        }
        
        return (responseData as AnyObject?, returnError as NSError?)
        
    }
    
}
