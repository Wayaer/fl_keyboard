import Flutter
import UIKit

class KeyboardViewController: UIInputViewController {
    public var flKeyboardEngine = FlutterEngine(name: "flKeyboardMain")
    public var flutterView: FlutterViewController?
    @IBOutlet var nextKeyboardButton: UIButton!
    
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
        view.addSubview(self.flutterView!.view)
     
        // Perform custom UI setup here
//        self.nextKeyboardButton = UIButton(type: .system)
//
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//        self.nextKeyboardButton.sizeToFit()
//        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
//
//        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
//
//        self.view.addSubview(self.nextKeyboardButton)
//
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
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
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

    override open func delete(_ sender: Any?) {}
    
    override func dismissKeyboard() {}
    
    func isOpenAccessGranted() -> Bool {
        UIPasteboard.general.string = "CHECK"
        return UIPasteboard.general.hasStrings
    }
}
