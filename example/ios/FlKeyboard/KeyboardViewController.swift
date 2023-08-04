import fl_keyboard
import Flutter
import UIKit

class KeyboardViewController: UIInputViewController {
    public var flKeyboardEngine = FlutterEngine(name: "flKeyboardMain")
    public var flutterView: FlutterViewController?
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func updateViewConstraints() {
        super.updateViewConstraints()
        print("updateViewConstraints=====")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.flutterView = FlutterViewController(
            engine: self.flKeyboardEngine,
            nibName: nil,
            bundle: nil)
        self.flKeyboardEngine.run(withEntrypoint: "flKeyboardMain")
        print("viewDidLoad=====")
        self.view.addSubview(self.flutterView!.view)
        addChild(self.flutterView!)
        view.addSubview(self.flutterView!.view)
        self.flutterView!.didMove(toParent: self)
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews=====")
    }

    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear=====")
        print("hasFullAccess \(hasFullAccess)")
    }
    
    override public func textWillChange(_ textInput: UITextInput?) {
        print("textWillChange=====")
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override public func textDidChange(_ textInput: UITextInput?) {
        print("textDidChange=====")
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    override open func delete(_ sender: Any?) {}
    
    override func dismissKeyboard() {}
    
    func isOpenAccessGranted() -> Bool {
        UIPasteboard.general.string = "CHECK"
        return UIPasteboard.general.hasStrings
    }
}
