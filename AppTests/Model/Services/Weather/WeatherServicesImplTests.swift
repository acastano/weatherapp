
import XCTest

class WeatherServicesImplTests: XCTestCase {

    func testTemperatureTermSuccess() {
        
        let remote = RemoteSuccessImpl(dataTask: DataTaskWeatherSuccess(), timeout: 0)
        
        let services = WeatherServicesImpl(remote: remote)
        
        services.temperature(nil) { weather, error in
         
            XCTAssert(weather != nil && error == nil)
            
        }
        
    }
    
    func testTemperatureLocationSuccess() {
        
        let remote = RemoteSuccessImpl(dataTask: DataTaskWeatherSuccess(), timeout: 0)
        
        let services = WeatherServicesImpl(remote: remote)
        
        services.temperature(0, longitude: 0) { weather, error in
            
            XCTAssert(weather != nil && error == nil)
            
        }
        
    }
    
    func testTemperatureTermFailure() {
        
        let remote = RemoteFailureImpl(dataTask: DataTaskFailure(), timeout: 0)
        
        let services = WeatherServicesImpl(remote: remote)
        
        services.temperature(nil) { weather, error in
            
            XCTAssert(weather == nil && error != nil)
            
        }
        
    }
    
    func testTemperatureLocationFailure() {
                
        let remote = RemoteFailureImpl(dataTask: DataTaskFailure(), timeout: 0)
        
        let services = WeatherServicesImpl(remote: remote)

        services.temperature(0, longitude: 0) { weather, error in
            
            XCTAssert(weather == nil && error != nil)
            
        }
        
    }
    
}
