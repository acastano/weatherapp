
import XCTest

class DataTaskImplTests: XCTestCase {
    
    func testNoURLReturnsError() {
        
        let task = DataTaskImpl()
        
        task.loadData(nil, timeout: 0) { (data, response, error) in
            
            XCTAssert(error != nil)
            
            XCTAssert(error?._domain == ErrorDomain.dataTask.rawValue)
            
        }
        
    }
    
}
