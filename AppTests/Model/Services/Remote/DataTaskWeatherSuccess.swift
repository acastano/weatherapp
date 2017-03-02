
import Foundation

class DataTaskWeatherSuccess: NSObject, DataTask {
    
    func loadData(_ url: URL?, timeout: Double, completion:@escaping DataResponseErrorCompletion) {
        
        let data = dataFromFile("weather.json", bundle:Bundle(for: type(of: self)))
        
        completion(data, nil, nil)
        
    }
    
}
