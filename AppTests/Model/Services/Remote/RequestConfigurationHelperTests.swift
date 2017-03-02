
import XCTest

class RequestConfigurationHelperTests: XCTestCase {

    fileprivate let helper = RequestConfigurationHelper()
    
    func testValidParameters() {
        
        let p = helper.parameters()

        XCTAssertEqual(p, "APPID=aa06cee571a3252d72940e9297767c78")
        
    }
    
    func testValidURL() {
        
        let url = helper.url("", method:.GET, parameters:"")?.absoluteString
        
        XCTAssertEqual(url, "https://test.com/")
        
    }
    
    func testValidURLWithAction() {
        
        let url = helper.url("action", method:.GET, parameters:"")?.absoluteString
        
        XCTAssertEqual(url, "https://test.com/action")
        
    }
    
    func testValidURLWithActionAndParameters() {
        
        let url = helper.url("action", method:.GET, parameters:helper.parameters())?.absoluteString
        
        XCTAssertEqual(url, "https://test.com/action?APPID=aa06cee571a3252d72940e9297767c78")
        
    }

}
