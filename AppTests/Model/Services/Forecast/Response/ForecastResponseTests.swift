
import XCTest

class ForecastResponseTests: XCTestCase {

    fileprivate let response = ForecastResponse(city: City(id: 3674962, name: "Medellin"))
    
    func testErrorIsSet() {

        let error = NSError(domain: "", code: 0, userInfo: nil)

        response.populateWithData(nil, error: error)
        
        XCTAssert(response.error != nil)
        
    }
    
    func testValidJSON() {
        
        let json = dictionaryFromJSONFile("forecast.json", bundle: Bundle(for: type(of: self)))
        
        response.populateWithData(json, error: nil)
        
        XCTAssert(response.forecast != nil)
        
        XCTAssert(response.forecast?.count == 1)
        
        if let forecast = response.forecast {
            
            for weather in forecast {
                
                XCTAssertTrue(weather.city.id == 3674962)
                
                XCTAssertTrue(weather.city.name == "Medellin")
                
                XCTAssertTrue(weather.wind?.speed == 0.62)
                
                XCTAssertTrue(weather.temp == 13.38)
                
                XCTAssertTrue(weather.temp_min == 13.38)
                
                XCTAssertTrue(weather.temp_max == 13.38)
                
                XCTAssertTrue(weather.date == "2016-06-17 00:00:00")
                
                XCTAssertTrue(weather.details?.description == "moderate rain")
                
            }
            
        }
        
    }

    func testPopulateReturnsErrorWithInvalidJSON() {
        
        let json = dictionaryFromJSONFile("forecastinvalid.json", bundle: Bundle(for: type(of: self)))
        
        response.populateWithData(json, error: nil)
        
        XCTAssert(response.error != nil)
        
        XCTAssert(response.error?.domain == ErrorDomain.forecast.rawValue)
        
    }
    
}
