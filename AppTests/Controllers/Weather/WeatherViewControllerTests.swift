
import XCTest

class WeatherViewControllerTests: XCTestCase, LocationServicesDelegate {
    
    fileprivate var locationUpdatesPass = false
    fileprivate var controller: WeatherViewController?
    
    func testSetup() {
        
        let locationServices = LocationServicesSuccessImpl()
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: locationServices, forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()

        XCTAssertTrue(locationServices.delegate as? WeatherViewController != nil)
        
        XCTAssertTrue(controller?.noLocationLabel.text == "WeatherViewControllerNoLocation")
        
        XCTAssertTrue(controller?.enterButton.titleLabel?.text == "WeatherViewControllerEnterCity")
        
        XCTAssertTrue(controller?.settingsButton.titleLabel?.text == "WeatherViewControllerSettings")
        
    }
    
    func testOutletsAreAssigned() {
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: LocationServicesSuccessImpl(), forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()
        
        XCTAssertTrue(controller?.infoLabel != nil)
        
        XCTAssertTrue(controller?.contentView != nil)
        
        XCTAssertTrue(controller?.titleLabel != nil)
        
        XCTAssertTrue(controller?.speedLabel != nil)
        
        XCTAssertTrue(controller?.enterButton != nil)
        
        XCTAssertTrue(controller?.weatherLabel != nil)
        
        XCTAssertTrue(controller?.noLocationView != nil)
        
        XCTAssertTrue(controller?.settingsButton != nil)
        
        XCTAssertTrue(controller?.noLocationLabel != nil)
        
        XCTAssertTrue(controller?.temperatureMaxLabel != nil)
        
        XCTAssertTrue(controller?.temperatureMinLabel != nil)
        
        XCTAssertTrue(controller?.infoLabelHeightConstraint != nil)
        
        XCTAssertTrue(controller?.speedLabelHeightConstraint != nil)
        
        XCTAssertTrue(controller?.temperaturesContainerView != nil)
        
        XCTAssertTrue(controller?.temperaturesContainerViewHeightConstraint != nil)
        
    }
    
    func testForecastLabelsAreSet() {
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: LocationServicesSuccessImpl(), forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()
        
        controller?.locationFound(0, longitude: 0)

        let cell = controller?.collectionView(controller!.forecastCollectionView, cellForItemAtIndexPath: IndexPath(row: 0, section: 0))

        XCTAssertTrue(cell is ForecastCollectionViewCell)
        
        let forecastCell = cell as? ForecastCollectionViewCell
        
        XCTAssertTrue(forecastCell?.dateLabel.text == "Mon")
        XCTAssertTrue(forecastCell?.timeLabel.text == "00:00")
        XCTAssertTrue(forecastCell?.minimumLabel.text == "28.0")
        XCTAssertTrue(forecastCell?.maximumLabel.text == "32.0")
        
    }
    
    func testLocationNotAvailableShowsNoLocation() {
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: LocationServicesSuccessImpl(), forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()

        controller?.locationNotAvailable()
        
        XCTAssertTrue(controller?.contentView.isHidden == true)
        
        XCTAssertTrue(controller?.noLocationView.isHidden == false)
        
    }
    
    func testStartUpdatesIsCalled() {
        
        locationUpdatesPass = false
        
        let services = LocationServicesSuccessImpl()
        
        services.delegate = self
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: services, forecastServices: ForecastServicesSuccessImpl())
                
        controller?.viewWillAppear(false)
        
        XCTAssertTrue(services.delegate != nil)

        XCTAssertTrue(locationUpdatesPass)
        
    }
    
    func testStopUpdatesIsCalled() {
        
        locationUpdatesPass = false
        
        let services = LocationServicesSuccessImpl()
        
        services.delegate = self
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: services, forecastServices: ForecastServicesSuccessImpl())
        
        controller?.viewWillDisappear(false)
        
        XCTAssertTrue(services.delegate != nil)
        
        XCTAssertTrue(locationUpdatesPass)
        
    }
    
    func testLoadWeatherWithLatitudeAndLogitudeUpdateViews() {
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: LocationServicesSuccessImpl(), forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()
        
        controller?.locationFound(0, longitude: 0)
        
        validateSuccess()

    }
    
    func testLoadWeatherWithTermUpdateViews() {
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: LocationServicesSuccessImpl(), forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()
        
        controller?.enterTapped(self)
        
        validateSuccess()
        
    }
    
    func testLocationNotAvailableUpdateViews() {
        
        let services = LocationServicesSuccessImpl()

        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: services, forecastServices: ForecastServicesSuccessImpl())

        controller?.view.layoutIfNeeded()
        
        services.stopUpdates()
        
        XCTAssertTrue(controller?.contentView.isHidden == true)
        
        XCTAssertTrue(controller?.noLocationView.isHidden == false)
        
    }
    
    func testLocationFoundUpdateViews() {
        
        let services = LocationServicesSuccessImpl()
        
        controller = WeatherViewController.controller(WeatherServicesSuccessImpl(), locationServices: services, forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()
        
        services.startUpdates()
        
        validateSuccess()

    }
    
    func testLocationFoundWithPartialDataUpdateViews() {
        
        let services = LocationServicesSuccessImpl()
        
        controller = WeatherViewController.controller(WeatherServicesSuccessPartiallyImpl(), locationServices: services, forecastServices: ForecastServicesSuccessImpl())
        
        controller?.view.layoutIfNeeded()
        
        services.startUpdates()
        
        XCTAssertTrue(controller?.view.viewWithTag(loadingTag) == nil)
        
        XCTAssertTrue(controller?.contentView.isHidden == false)
        
        XCTAssertTrue(controller?.noLocationView.isHidden == true)
        
        XCTAssertTrue(controller?.titleLabel.text == "Name")
        
        XCTAssertTrue(controller?.weatherLabel.text == "30.0 WeatherViewControllerCelsius")
        
    }
    
    //MARK: Helpers
    
    fileprivate func validateSuccess () {
        
        XCTAssertTrue(controller?.view.viewWithTag(loadingTag) == nil)
        
        XCTAssertTrue(controller?.contentView.isHidden == false)
        
        XCTAssertTrue(controller?.noLocationView.isHidden == true)
        
        XCTAssertTrue(controller?.infoLabel.text == "Details")
        
        XCTAssertTrue(controller?.titleLabel.text == "Name")
        
        XCTAssertTrue(controller?.weatherLabel.text == "30.0 WeatherViewControllerCelsius")
        
        XCTAssertTrue(controller?.speedLabel.text == "WeatherViewControllerWindSpeed 10.0 WeatherViewControllerMetersPerSec")
        
        XCTAssertTrue(controller?.temperatureMaxLabel.text == "32.0°C WeatherViewControllerMax")
        
        XCTAssertTrue(controller?.temperatureMinLabel.text == "28.0°C WeatherViewControllerMin")
        
        XCTAssertTrue(controller?.infoLabelHeightConstraint?.constant == 30)
        
        XCTAssertTrue(controller?.speedLabelHeightConstraint.constant == 30)
        
        XCTAssertTrue(controller?.temperaturesContainerViewHeightConstraint.constant == 30)
        
    }
    
    //MARK - LocationServicesDelegate
    
    func locationFound(_ latitude:Double, longitude:Double) {

        locationUpdatesPass = true

    }
    
    func locationNotAvailable() {
        
        locationUpdatesPass = true
        
    }

}
