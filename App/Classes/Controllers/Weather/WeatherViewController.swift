
import UIKit

final class WeatherViewController: UIViewController, LocationServicesDelegate {

    fileprivate let identifier = "identifier"
    
    fileprivate var forecast: [Weather]?
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var infoLabelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedLabelHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var temperaturesContainerView: UIView!
    @IBOutlet weak var temperaturesContainerViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var noLocationView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var noLocationLabel: UILabel!
    @IBOutlet weak var temperatureMaxLabel: UILabel!
    @IBOutlet weak var temperatureMinLabel: UILabel!
    @IBOutlet weak var forecastCollectionView: UICollectionView!
    
    fileprivate let defaultViewHeight = CGFloat(30)
    fileprivate var weatherServices: WeatherServices?
    fileprivate var locationServices: LocationServices?
    fileprivate var forecastServices: ForecastServices?
    
    class func controller(_ weatherServices: WeatherServices, locationServices:LocationServices, forecastServices: ForecastServices) -> WeatherViewController? {
    
        let controller = UIStoryboard.instantiateViewController(shortClassName(), anyClass:self) as? WeatherViewController
    
        controller?.weatherServices = weatherServices
    
        controller?.locationServices = locationServices
        
        controller?.forecastServices = forecastServices
    
        return controller
    
    }
    
    //MARK: - Life cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        locationServices?.startUpdates()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        locationServices?.stopUpdates()
        
    }
    
    //MARK: - Helpers

    fileprivate func setup() {
        
        locationServices?.delegate = self
        
        noLocationLabel.text = NSLocalizedString("WeatherViewControllerNoLocation", comment: "")
        
        enterButton.setTitle(NSLocalizedString("WeatherViewControllerEnterCity", comment: ""), for: UIControlState())
        
        settingsButton.setTitle(NSLocalizedString("WeatherViewControllerSettings", comment: ""), for: UIControlState())
        
    }
    
    fileprivate func showLoading() {
        
        contentView.isHidden = true
        
        noLocationView.isHidden = true
        
        LoadingUtils.showLoading(view, message: NSLocalizedString("LoadingUtilsLoading", comment:""))
        
    }
    
    fileprivate func loadWeather(_ latitude:Double, longitude:Double) {
        
        showLoading()
        
        weatherServices?.temperature(latitude, longitude: longitude) { [weak self] weather, error in
            
            if let instance = self {
            
                instance.processWeather(weather, error: error)
                
            }
            
        }
        
    }
    
    fileprivate func loadWeather(_ term:String?) {

        showLoading()
        
        weatherServices?.temperature(term) { [weak self] weather, error in
            
            if let instance = self {
                
                instance.processWeather(weather, error: error)
                
            }
            
        }
        
    }
    
    fileprivate func processWeather(_ weather:Weather?, error:NSError?) {
        
        LoadingUtils.hideLoading(view)

        contentView.isHidden = error != nil
        
        noLocationView.isHidden = error == nil
        
        if let weather = weather {
            
            updateInfo(weather)
            
            updateSpeed(weather)
            
            updateTemperatures(weather)
            
            updateTitleAndTemperature(weather)
            
            updateForecast(weather)
            
        }

    }
    
    fileprivate func updateTitleAndTemperature(_ weather:Weather) {
        
        titleLabel.text = weather.city.name
        
        weatherLabel.text = String(weather.temp) + " " + NSLocalizedString("WeatherViewControllerCelsius", comment: "")
        
    }
    
    fileprivate func updateInfo(_ weather:Weather) {
        
        if let info = weather.details?.description?.capitalized, info.characters.count > 0 {
            
            infoLabel.text = info
            
            infoLabelHeightConstraint.constant = defaultViewHeight
            
        } else {
            
            infoLabelHeightConstraint.constant = 0
            
        }
        
    }
    
    fileprivate func updateForecast(_ weather:Weather) {

        forecastServices?.forecast(weather.city) { [weak self] forecast, error in
         
            if let instance = self {
                
                instance.forecast = forecast
                
                instance.forecastCollectionView.reloadData()
                
            }
            
        }
        
    }
    
    fileprivate func updateSpeed(_ weather:Weather) {
        
        if let speed = weather.wind?.speed {
            
            speedLabel.text = NSLocalizedString("WeatherViewControllerWindSpeed", comment: "") + " " + String(speed) + " " + NSLocalizedString("WeatherViewControllerMetersPerSec", comment: "")
            
            speedLabelHeightConstraint.constant = defaultViewHeight
            
        } else {
            
            speedLabelHeightConstraint.constant = 0
            
        }
        
    }
    
    fileprivate func updateTemperatures(_ weather:Weather) {
        
        if let temp_max = weather.temp_max, let temp_min = weather.temp_min {
            
            temperatureMaxLabel.text = String(temp_max) + "°C" + " " + NSLocalizedString("WeatherViewControllerMax", comment: "")
            
            temperatureMinLabel.text = String(temp_min) + "°C" + " " + NSLocalizedString("WeatherViewControllerMin", comment: "")
            
            temperaturesContainerViewHeightConstraint.constant = defaultViewHeight
            
        } else {
            
            temperaturesContainerViewHeightConstraint.constant = 0
            
        }

    }
    
    fileprivate func showEnterCity() {
        
        AlertPresenter.showEnterCityFromController(self) { term in
            
            self.loadWeather(term)
            
        }
        
    }
    
    //MARK: - Actions
    
    @IBAction func settingsTapped(_ sender:AnyObject) {
        
        if let url = URL(string:UIApplicationOpenSettingsURLString) {
            
            UIApplication.shared.openURL(url)
            
        }
        
    }
    
    @IBAction func enterTapped(_ sender:AnyObject) {
        
       showEnterCity()
        
    }
    
    //MARK: - UICollectionViewSource/Delegate
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let count = forecast?.count ?? 0
        
        return count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for:indexPath) as? ForecastCollectionViewCell
        
        if let weather = forecast?[indexPath.row] {
        
            cell?.weather = weather
            
        }
        
        return cell!
        
    }
    
    //MARK: - LocationServicesDelegate
    
    func locationNotAvailable() {
        
        contentView.isHidden = true
        
        noLocationView.isHidden = false
        
    }
    
    func locationFound(_ latitude:Double, longitude:Double) {
        
        loadWeather(latitude, longitude: longitude)
        
    }

}
