import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        var rootViewController : RootViewController = window?.rootViewController as! RootViewController

        var messages = ["The last thing you remember is the sound of rocks falling all around you.", "Your arm is pinned, but you can hear rumbling noises in the distance"]
        var scriptCoordinator : ScriptCoordinator = Script(observer: rootViewController, messages: messages)
        rootViewController.scriptCoordinator = scriptCoordinator
        return true
    }

}

