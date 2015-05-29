import MinesOfMios

class FakeUI : ScriptObserver {
    var lastMessageReceived : String = ""

    func displayMessage(arg: String) {
        self.lastMessageReceived = arg
    }

    func lastMessage() -> String {
        return self.lastMessageReceived
    }
}