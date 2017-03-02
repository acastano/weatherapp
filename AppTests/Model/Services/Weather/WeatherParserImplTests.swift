
import XCTest

class WeatherParserImplTests: XCTestCase {
    
    func testParsing() {
        
        let parser = WeatherParserImpl()
        
        let json = dictionaryFromJSONFile("weather.json", bundle: Bundle(for: type(of: self))) as! [String:AnyObject]

        let city = City(id: 3674962, name: "Medellin")
        
        let weather = parser.processWeather(city, temperature:22, json: json)

        XCTAssertTrue(weather.city.id == 3674962)

        XCTAssertTrue(weather.city.name == "Medellin")
        
        XCTAssertTrue(weather.wind?.speed == 2.6)
        
        XCTAssertTrue(weather.temp == 22)
        
        XCTAssertTrue(weather.temp_min == 22)
        
        XCTAssertTrue(weather.temp_max == 22)
        
        XCTAssertTrue(weather.details?.description == "broken clouds")
    
    }
    
}
