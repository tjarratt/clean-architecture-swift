import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        var rootViewController : RootViewController = window?.rootViewController as! RootViewController

        var messages = [
            "The last thing you remember is the sound of rocks falling all around you.",
            "Your arm is pinned, but you can hear rumbling noises in the distance",
        ]

        var scriptUseCase : ScriptWalkingUseCase = ScriptUseCase(observer: rootViewController, messages: messages)
        rootViewController.scriptUseCase = scriptUseCase
        return true
    }
}

