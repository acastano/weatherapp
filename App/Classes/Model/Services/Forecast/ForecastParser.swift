
protocol ForecastParser {
    
    func processForecast(_ city:City, jsonArray: [[String:AnyObject]]) -> [Weather]
    
}
