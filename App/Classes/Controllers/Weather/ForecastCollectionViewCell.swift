
import UIKit

final class ForecastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var maximumLabel: UILabel!
    @IBOutlet weak var minimumLabel: UILabel!
    
    var weather: Weather! {
        
        didSet {
            
            setup()
            
        }
        
    }
    
    fileprivate func setup() {
        
        dateLabel.text = weather?.date?.cccString()
        timeLabel.text = weather?.date?.HHmmString()
        
        minimumLabel.text = nil
        maximumLabel.text = nil
        
        if let temp_min = weather.temp_min {
        
            minimumLabel.text = String(temp_min)
            
        }
        
        if let temp_max = weather.temp_max {
            
            maximumLabel.text = String(temp_max)
            
        }
        
    }
    
}
