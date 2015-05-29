import UIKit

public class RootViewController: UIViewController, ScriptObserver {

    @IBOutlet public weak var label: UILabel!
    @IBOutlet public weak var breathe: UIButton!
    public var scriptUseCase: ScriptWalkingUseCase?

    override public func viewDidLoad() {
        super.viewDidLoad()
        self.scriptUseCase?.start()
    }

    public func displayMessage(message: String) {
        self.label.text = message
    }

    @IBAction public func userDidTapButton(sender: UIButton?) {
        self.scriptUseCase?.acknowledge()
    }
}

