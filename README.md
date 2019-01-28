BitTicker is an application help tracking crypto coins prices from different exchanges

## 🚨 Important note 🚨

This project is using cocoapods. Please be sure to run the ```pod install``` command before running the project.
If you have any doubt about cocoapods you can check the reference [here](https://cocoapods.org).

## Development tools

* Swift 4.2
* Xcode 10.1
* [Cocoapods](https://cocoapods.org) 1.5.3
* Minimun iOS version: 12.1

## Third-Party Libraries
* [Starscream](https://github.com/daltoniam/Starscream): Starscream is a conforming WebSocket (RFC 6455) client library in Swift.
* [Firebase](https://github.com/firebase): Firebase is an app development platform with tools to help you build, grow and monetize your app.
* [R.Swift](https://github.com/mac-cain13/R.swift): Get strong typed, autocompleted resources like images, fonts and segues in Swift projects
* [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD): A clean and lightweight progress HUD for your iOS and tvOS app.

## Project Architecture 

![alt tag](https://github.com/donjordano/BitTicker/blob/master/blobs/viper_architecture_graph.png)

References:
* [Viper architecture](https://www.objc.io/issues/13-architecture/viper/)
* [Viper for iOS](https://medium.com/@smalam119/viper-design-pattern-for-ios-application-development-7a9703902af6)

## How did I implement VIPER?

Basically, there is a protocol/contracts file for each scene in the app. This file defines the interaction between each layer as follows:

* View - Presenter: protocols to notify changes and to inject information to the UI.
* Presenter - Interactor: protocols to request / receive information to / from the interactor.
* Presenter - Router: protocol to define the transitions between scenes

Another important point is because using of protocols it's really easy to define mocks views/presenters/interactors/routers for testing.

```swift
// View / Presenter
protocol LoginView: class {
    var presenter: LoginPresentation! { get set }
    
    func showLogingView()
    func showTickerView()
    func showAlert(title: String, message: String)
    func showLoaderView(show: Bool)
}

protocol LoginPresentation: class {
    var view: LoginView? { get set }
    var interactor: LoginInteractorInput? { get set }
    var router: LoginWireframe! {  get set }
    
    func didClickLoginButton(withEmail email: String, andPassword password: String)
    func didClickRegisterButton(withEmail email: String, andPassword password: String)
    func showPairsList()
}

// Presenter to interactor
protocol LoginInteractorInput: class {
    var presenter: LoginInteractorOutput? {get set}
    func loginUser(email: String, password: String)
    func registerUser(email: String, password: String)
}

// Interactor to presenter
protocol LoginInteractorOutput: class {
    func succeed()
    func failed(error: String)
}

// Router
protocol LoginWireframe: class {
    var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
    func presentPairsList()
    
}

```

## Data models
Data model for this project is very simple. It represent single ticker data structure.

```swift
// Entity
struct Ticker {
    var tickerId: String
    var lastPrice: Double
    var lowestAsk: Double
    var higestAsk: Double
    var percent24: Double
    var higestTrade24: Double
    var lowestTrade24: Double
    var isFrozen: Bool
}
```

## Where the data is coming from?

The project is using **Poloniex** WebSocket, documentation can be found [here](https://docs.poloniex.com/#websocket-api).

## Managers

### ReachabilityManager

Used to manage the reachability. In this case I would like to notify a little issue related with the simulator. *It seems Xcode has an issue with the simulator because if you try to turn off the wifi and turning on again, the observer for the state change is not triggering. It's working 100% fine in a real device*

## Design 
The assets were create in **SketchApp**. The **.sketch** is included in the repository [here](https://github.com/donjordano/BitTicker/design)

## How it looks like?
![alt tag](https://github.com/donjordano/BitTicker/blob/master/blobs/screenshots.png?raw=true)

## Support && contact

### Email

You can contact me using my email: jordanov.ivan@gmai.com

### Twitter

Follow me [@donjordano](http://twitter.com/donjordnao) on twitter.
