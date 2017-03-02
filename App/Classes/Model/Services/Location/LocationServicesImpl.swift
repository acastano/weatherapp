
import CoreLocation

final class LocationServicesImpl: NSObject, LocationServices, CLLocationManagerDelegate {
    
    fileprivate var locationManager: CLLocationManager!

    var delegate: LocationServicesDelegate?

    override init() {
      
        super.init()
        
        setup()
        
    }
    
    //MARK: - Methods
    
    func startUpdates() {
        
        requestLocation()
        
    }
    
    func stopUpdates() {
    
        locationManager.stopUpdatingLocation()
    
    }
    
    //MARK: - Helpers

    fileprivate func setup() {
        
        locationManager = CLLocationManager()
        
        locationManager.delegate = self
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters

        locationManager.distanceFilter = 10

    }
    
    fileprivate func requestLocation() {

        stopUpdates()

        locationManager.requestWhenInUseAuthorization()

        locationManager.startUpdatingLocation()
        
    }
    
    fileprivate func processLocations(_ locations:[CLLocation]) {
        
        if let location = locations.last {
            
            delegate?.locationFound(location.coordinate.latitude, longitude: location.coordinate.longitude)
            
        }
        
    }
    
    //MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager:CLLocationManager, didFailWithError error:Error) {
        
        delegate?.locationNotAvailable()
        
    }
    
    func locationManager(_ manager:CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        
        processLocations(locations)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        requestLocation()
        
    }
   
}
