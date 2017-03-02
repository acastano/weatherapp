
import CoreLocation

class LocationServicesSuccessImpl: NSObject, LocationServices {
    
    var delegate: LocationServicesDelegate?

    //MARK: - Methods
    
    func startUpdates() {
    
        delegate?.locationFound(0, longitude: 0)
        
    }
    
    func stopUpdates() {
    
        delegate?.locationNotAvailable()
        
    }
   
}
