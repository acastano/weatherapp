
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application:UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = Window(frame:UIScreen.main.bounds)
        
        window?.backgroundColor = UIColor.white

        window?.rootViewController = WeatherViewController.controller(WeatherServicesFactory.services(), locationServices:LocationServicesFactory.services(), forecastServices: ForecastServicesFactory.services())
        
        window?.makeKeyAndVisible()

        return true
        
    }
    
}

