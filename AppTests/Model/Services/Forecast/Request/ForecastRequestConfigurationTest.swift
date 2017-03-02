
import XCTest

class ForecastRequestConfigurationTest: XCTestCase {
    
    fileprivate let request = ForecastRequestConfiguration(city:City(id:2, name:"name"))
 
    func testValidAction() {
        
        XCTAssertTrue(request.action() == "data/2.5/forecast")
        
    }
    
    func testValidParameters() {
        
        let parameters = request.parameters()
        
        XCTAssertTrue(parameters == "APPID=aa06cee571a3252d72940e9297767c78&id=2&units=metric")
        
    }
    
    func testValidURL() {
        
        let url = request.url()?.absoluteString
        
        XCTAssertTrue(url == "https://test.com/data/2.5/forecast?APPID=aa06cee571a3252d72940e9297767c78&id=2&units=metric")
        
    }
    
    func testValidMethod() {
        
        let method = request.method()
        
        XCTAssertTrue(method == .GET)
        
    }
    
}
