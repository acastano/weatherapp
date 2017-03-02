
import Foundation

typealias WeatherErrorCompletion = (Weather?, NSError?) -> ()

protocol WeatherServices {

    func temperature(_ term:String?, completion:WeatherErrorCompletion?)
    func temperature(_ latitude:Double, longitude:Double, completion:WeatherErrorCompletion?)
    
}
