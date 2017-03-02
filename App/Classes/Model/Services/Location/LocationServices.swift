
protocol LocationServices: class {
    
    var delegate: LocationServicesDelegate? {get set}

    func startUpdates()
    func stopUpdates()

}
