
import Foundation

final class WeatherServicesFactory {
    
    class func services() -> WeatherServices {
        
        let remote = RemoteImpl(dataTask: DataTaskImpl(), timeout: 10)
        
        let services = WeatherServicesImpl(remote: remote)

        return services
        
    }
    
}