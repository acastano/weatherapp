
import XCTest

class AppDelegateTests: XCTestCase {
    
    func testAppDelegateSetWeatherControllerAsRoot() {
        
        let appDelegate = AppDelegate()
        
        _ = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        
        XCTAssertTrue(appDelegate.window?.rootViewController is WeatherViewController)
        
    }
    
}

