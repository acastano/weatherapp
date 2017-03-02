
# README #

## Prerequisites ##

* iOS 8+
* Latest version of Xcode

## Instructions ##

* Open App.xcodeproj. When open press run using a simulator or device. 

* Run the test using CMD + U

* Select a location from the location icon in Xcode if you want to change location (This is for testing purposes).

* In some simulators primarly in iOS 8 the location icon doesn't work straight away. Kill the simulator and run the app again if that happens.

* The project has one view controller called WeatherViewController that shows the weather. If location services are disabled people will have the opportunity to enter a city manually. If you have entered the location manually and you enable location services again the weather data will be replaced with the current location.

* Unit tests are done with XCTest. The test covearage is 94% there are some bits that will be better cover using App testing with other tools. It would be possible to add more coverage using something like OCMock for Apple classes. (CLLocationManager, NSURLSession, etc) for that we will have to do some unit testing in Objective C where we pretent to use OCMock. 

* There are not third party libraries and the code is written using the below coding standards

## Coding standards ##

### Naming ###

* Use descriptive names with camelcase for classes, methods, variables, etc. Classes should be capitalized while method names should start with lowercase 

### Spacing ###

* One line between any line of code (Not on variables definitions)
* Method braces always open in the same line
* Use one space separation between any operators for clarity

### Code Separation ###

* Use //MARK: - to make navigating the code easier

### Conditionals ###

* Conditionals bodies should always be in braces

### Ternary Operator ###

* Should only be used when increases clarity

### Methods ###

* There should be an space between method arguments

### Extensions naming ###

* ClassName+Functionality

### Protocols ###

* Declare all protocols in its own file
* File should have the same name as the protocol

### Use of self ###

* Avoid using self since Swift doesn’t require it to access objects or
methods

### Completion blocks ###

* Don't include their definition unless is necessary e.g () -> () in remove () -> ()

### Types ###

* Try to use native types when available

### Type inference ###

* Let the compiler infer the type for a constant or variable unless you need to specify a type

### Semicolons ###

* No need to use them, you should not have two statements in the same line

### Code header comments ###

* Should be removed as the code belongs to the team not to the person the has created the class

### Other considerations ###

* Keep it simple
* Keep classes and methods short
* No comments (the code should be self explanatory)

## Project structure ##

* Classes
* * AppDelegate
* * Utils
* * Vendors 
* * Model
* * * Domain
* * * Services 
* * Controllers
* * * ViewControllers (Storyboards)
* * * Views 
* * Resources
* * * Images, fonts, strings, plists, etc

### Folders ###

* Create class folders in finder and drag them to Xcode

### Configs ###

* Configuration driven by xcconfigs

## Unit Testing ##

* Unit testing is done using XCTest

