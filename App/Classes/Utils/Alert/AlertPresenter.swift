
import UIKit

class AlertPresenter {
    
    class func showEnterCityFromController(_ fromController:UIViewController, completion:@escaping StringCompletion) {
        
        let controller = UIAlertController(title: NSLocalizedString("WeatherViewControllerEnterCity", comment: ""), message: NSLocalizedString("WeatherViewControllerEnterPlaceholder", comment: ""), preferredStyle: .alert)
        
        controller.addTextField(configurationHandler: nil)
        
        let enterAction = UIAlertAction(title: NSLocalizedString("UIAlertActionOK", comment: ""), style: .default) { action in
            
            if let text = controller.textFields?.first?.text, text.characters.count > 0 {
                
                completion(text)
                
            }
            
        }
        
        controller.addAction(enterAction)
        
        let cancelAction = UIAlertAction(title: NSLocalizedString("UIAlertActionCancel", comment: ""), style: .cancel, handler:nil)
        
        controller.addAction(cancelAction)
        
        fromController.present(controller, animated: true, completion: nil)
        
    }
    
}
