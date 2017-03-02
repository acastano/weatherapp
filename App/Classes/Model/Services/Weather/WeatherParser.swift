
protocol WeatherParser {
    
    func processWeather(_ city:City, temperature:Double, json: [String : AnyObject]) -> Weather
    
}
