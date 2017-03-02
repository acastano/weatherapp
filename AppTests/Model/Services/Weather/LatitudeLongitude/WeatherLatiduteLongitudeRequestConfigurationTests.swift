
import XCTest

class WeatherLatiduteLongitudeRequestConfigurationTests: XCTestCase {

    fileprivate let request = WeatherLatitudeLongitudeRequestConfiguration(latitude: 0, longitude: 0)
    
    func testValidURL() {
        
        let url = request.url()?.absoluteString
        
        XCTAssert(url == "https://test.com/data/2.5/weather?APPID=aa06cee571a3252d72940e9297767c78&lat=0.0&lon=0.0&units=metric")
        
    }
    
    func testValidParameters() {
        
        let parameters = request.parameters()
        
        XCTAssert(parameters == "APPID=aa06cee571a3252d72940e9297767c78&lat=0.0&lon=0.0&units=metric")
        
    }
    
    func testValidAction() {
        
        let action = request.action()
        
        XCTAssert(action == "data/2.5/weather")
        
    }
    
    func testRequestMethod() {
        
        let method = request.method()
        
        XCTAssert(method == .GET)
        
    }

}
