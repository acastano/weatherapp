
import Foundation

extension String {
    
    func cccString() -> String? {
        
        var dateString: String?
        
        let df = dateFormatter("yyyy-MM-dd HH:mm:ss")
        
        if let date = df.date(from: self) {
        
            let df = dateFormatter("ccc")
            
            dateString = df.string(from: date)
            
        }
        
        return dateString
        
    }
    
    func HHmmString() -> String? {
        
        var dateString: String?
        
        let df = dateFormatter("yyyy-MM-dd HH:mm:ss")
        
        if let date = df.date(from: self) {
            
            let df = dateFormatter("HH:mm")
            
            dateString = df.string(from: date)
            
        }
        
        return dateString
        
    }
    
    fileprivate func dateFormatter(_ format:String) -> DateFormatter {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = format
        
        dateFormatter.locale = Locale(identifier:"en")
        
        return dateFormatter
        
    }
    
}
