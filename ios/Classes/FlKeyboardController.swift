import Flutter
import UIKit

open class FlKeyboardController: UIInputViewController {
    public var flKeyboardEngine = FlutterEngine(name: "flKeyboardMain")
    public var flutterView: FlutterViewController?
    
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
    
    override public func textWillChange(_ textInput: UITextInput?) {
        print("textWillChange=====")
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override public func textDidChange(_ textInput: UITextInput?) {
        print("textDidChange=====")
        // The app has just changed the document's contents, the document context has been updated.
    }
    
    override open func delete(_ sender: Any?) {
        self.flutterView?.delete(nil)
        self.flutterView = nil
    }
}
