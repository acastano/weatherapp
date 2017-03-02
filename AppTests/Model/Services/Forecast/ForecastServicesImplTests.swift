
import XCTest

class ForecastServicesImplTests: XCTestCase {
    
    func testForecastSuccess() {

        let remote = RemoteSuccessImpl(dataTask: DataTaskForecastSuccess(), timeout: 0)
        
        let services = ForecastServicesImpl(remote: remote)
        
        let city = City(id: 1, name: "name")
        
        var forecast: [Weather]?
        
        services.forecast(city) { list, error in
            
            forecast = list
            
        }
        
        XCTAssert(forecast != nil)
        
    }
    
    func testForecastFailure() {
        
        let remote = RemoteFailureImpl(dataTask: DataTaskFailure(), timeout: 0)
        
        let services = ForecastServicesImpl(remote: remote)
        
        let city = City(id: 1, name: "name")
        
        var error: NSError?
        
        services.forecast(city) { list, anError in
            
            error = anError
            
        }
        
        XCTAssert(error != nil)
        
        XCTAssert(error?.domain == "error")
        
    }

}
