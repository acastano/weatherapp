
import XCTest

class RemoteImplTests: XCTestCase {
    
    func testSuccess() {
        
        let remote = RemoteImpl(dataTask: DataTaskWeatherSuccess(), timeout: 0)
        
        let response = WeatherResponse()
        
        remote.makeRequest(WeatherSearchRequestConfiguration(term: nil), response: response) {
            
            XCTAssert(response.error == nil && response.weather != nil)
            
        }
        
    }
    
    func testFailureCorrupted() {
        
        let remote = RemoteImpl(dataTask: DataTaskCorrupted(), timeout: 0)
        
        let response = WeatherResponse()
        
        remote.makeRequest(WeatherSearchRequestConfiguration(term: nil), response: response) {
            
            XCTAssert(response.error != nil && response.weather == nil)
            
        }
        
    }
    
    func testFailure() {
        
        let remote = RemoteImpl(dataTask: DataTaskFailure(), timeout: 0)
        
        let response = WeatherResponse()
        
        remote.makeRequest(WeatherSearchRequestConfiguration(term: nil), response: response) {
         
            XCTAssert(response.error != nil && response.weather == nil)
            
        }
        
    }
    
}
