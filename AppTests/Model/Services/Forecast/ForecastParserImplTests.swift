
import XCTest

class ForecastParserTests: XCTestCase {

    fileprivate let parser = ForecastParserImpl()
    fileprivate let forecastParser = WeatherParserImpl()

    func testParsing() {
        
        let jsonArray = dictionaryFromJSONFile("forecastlist.json", bundle: Bundle(for: type(of: self))) as! [[String:AnyObject]]
                
        let city = City(id: 3674962, name: "Medellin")
        
        let forecast = parser.processForecast(city, jsonArray: jsonArray)
        
        XCTAssert(forecast.count == 1)

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
