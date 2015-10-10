import UIKit

@UIApplicationMain
public class AppDelegate: UIResponder, UIApplicationDelegate {

    public var window: UIWindow?

    public func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let rootViewController : RootViewController = window?.rootViewController as! RootViewController

        let messages = [
            "The last thing you remember is the sound of rocks falling all around you.",
            "Your arm is pinned, but you can hear rumbling noises in the distance",
        ]

        let script = Script(messages: messages)
        rootViewController.scriptUseCase = ScriptUseCase(observer: rootViewController, script: script)
        return true
    }
}

