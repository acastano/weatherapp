
import Foundation

final class LocationServicesFactory {
    
    class func services() -> LocationServices {
        
        let services = LocationServicesImpl()

        return services
        
    }
    
}