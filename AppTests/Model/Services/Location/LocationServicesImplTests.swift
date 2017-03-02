
import XCTest
import CoreLocation

class LocationServicesImplTests: XCTestCase, LocationServicesDelegate {
    
    fileprivate let services = LocationServicesImpl()
    fileprivate let locationManager = CLLocationManager()

    fileprivate var notAvailable = false
    fileprivate var locationSucess = false
    
    func testLocationFailureCallsNotAvailable() {
        
        notAvailable = false
        
        services.delegate = self
        
        let error = NSError(domain: "", code: 0, userInfo: nil)
        
        services.locationManager(locationManager, didFailWithError:error)
        
        XCTAssert(notAvailable == true)
        
    }
    
    func testLocationSuccessCallsLocationFound() {
        
        locationSucess = false
        
        services.delegate = self
        
        let coordinate = CLLocation(latitude: 0.1, longitude: 0.1)
        
        services.locationManager(locationManager, didUpdateLocations: [coordinate])
     
        XCTAssert(locationSucess == true)
        
    }
    
    //MARK: - LocationServicesDelegate
    
    func locationNotAvailable() {
        
        notAvailable = true
        
    }
    
    func locationFound(_ latitude:Double, longitude:Double) {
        
        locationSucess = true
        
    }
   
}

