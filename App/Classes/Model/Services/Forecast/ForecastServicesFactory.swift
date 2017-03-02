
import Foundation

final class ForecastServicesFactory {
    
    class func services() -> ForecastServices {
        
        let remote = RemoteImpl(dataTask: DataTaskImpl(), timeout: 10)
        
        let services = ForecastServicesImpl(remote: remote)

        return services
        
    }
    
}