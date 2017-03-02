
import Foundation

final class RequestConfigurationHelper {
    
    fileprivate let host: String?
    fileprivate let requestProtocol: RequestProtocol?
    
    init() {
        
        let config = Bundle(for:type(of: self)).object(forInfoDictionaryKey: NetworkConfigurationAttributes.name.rawValue) as? [String:AnyObject]

        host = config?[RequestAttributes.host.rawValue] as? String
        
        requestProtocol = RequestProtocol(rawValue:config?[RequestAttributes.requestProtocol.rawValue] as? String ?? RequestProtocol.http.rawValue)
        
    }
    
    func parameters() -> String {
        
        return "\(CommonAttributes.key.rawValue)=\(CommonAttributes.keyValue.rawValue)"
        
    }
    
    func url(_ action:String, method:RequestMethod, parameters:String) -> URL? {
        
        var components = URLComponents()
        
        components.scheme = requestProtocol?.rawValue
        
        components.host = host
        
        components.path = "/" + action
        
        if parameters.characters.count > 0 {
            
            components.query = parameters
            
        }
        
        let url = components.url
        
        return url
        
    }
   
}
