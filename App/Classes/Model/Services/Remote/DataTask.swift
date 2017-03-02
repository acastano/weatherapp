
import Foundation

typealias DataResponseErrorCompletion = (_ data:Data?, _ response:URLResponse?, _ error:Error?) -> ()

protocol DataTask {
    
    func loadData(_ url:URL?, timeout:Double, completion:@escaping DataResponseErrorCompletion)

}
