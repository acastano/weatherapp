
import XCTest

class WeatherSearchRequestConfigurationTests: XCTestCase {
    
    fileprivate let request = WeatherSearchRequestConfiguration(term:"term")

    func testValidURL() {
        
        let url = request.url()?.absoluteString

        XCTAssert(url == "https://test.com/data/2.5/weather?APPID=aa06cee571a3252d72940e9297767c78&q=term&units=metric")
        
    }
    
    func testNoTermParameters() {
        
        let request = WeatherSearchRequestConfiguration(term:nil)
        
        let parameters = request.parameters()
        
        XCTAssert(parameters == "APPID=aa06cee571a3252d72940e9297767c78")
        
    }
    
    func testNoTermURL() {
        
        let request = WeatherSearchRequestConfiguration(term:nil)
        
        let url = request.url()?.absoluteString
        
        XCTAssert(url == "https://test.com/data/2.5/weather?APPID=aa06cee571a3252d72940e9297767c78")
        
    }
    
    func testValidParameters() {
        
        let parameters = request.parameters()
        
        XCTAssert(parameters == "APPID=aa06cee571a3252d72940e9297767c78&q=term&units=metric")

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
