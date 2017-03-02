
protocol LocationServicesDelegate: class {
    
    func locationNotAvailable()
    func locationFound(_ latitude:Double, longitude:Double)
    
}
