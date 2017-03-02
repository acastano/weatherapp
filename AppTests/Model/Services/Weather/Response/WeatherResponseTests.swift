
import XCTest

class WeatherResponseTests: XCTestCase {

    fileprivate let response = WeatherResponse()
    
    func testPopulateReturnsWeatherWithValidJSON() {
        
        let json = dictionaryFromJSONFile("weather.json", bundle: Bundle(for: type(of: self)))
        
        response.populateWithData(json, error: nil)
        
        XCTAssert(response.weather != nil)
        
    }
    
    func testPopulateReturnsErrorWithInvalidJSON() {
        
        let json = dictionaryFromJSONFile("weatherinvalid.json", bundle: Bundle(for: type(of: self)))
        
        response.populateWithData(json, error: nil)
        
        XCTAssert(response.error != nil)
        
        XCTAssert(response.error?.domain == ErrorDomain.weather.rawValue)
        
    }
    
    func testErrorIsSet() {
        
        let error = NSError(domain: "", code: 0, userInfo: nil)
        
        response.populateWithData(nil, error: error)
        
        XCTAssert(response.error != nil)
        
    }

}
