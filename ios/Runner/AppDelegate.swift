import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

  let platformChannel = "native-channel"
  let getFlavor = "GET_FLAVOR"
  let infoDictionary = "App - Flavor"

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // check and get native data from flutter
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    let flutterChannel = FlutterMethodChannel(name: self.platformChannel, binaryMessenger: controller.binaryMessenger)
    flutterChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        switch call.method {
        case self.getFlavor:
            let flavor = Bundle.main.infoDictionary?[self.infoDictionary]
            result(flavor)
        default:
            result(FlutterMethodNotImplemented)
            return
        }
    })

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
