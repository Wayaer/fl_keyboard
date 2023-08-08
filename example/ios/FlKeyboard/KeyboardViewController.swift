import UIKit
import Flutter

class KeyboardViewController: UIInputViewController {
    public var engine: FlutterEngine?
    public var flutterView: FlutterViewController?
    @IBOutlet var nextKeyboardButton: UIButton!
    
    convenience init() {
        self.init()
        print("init=====")
        let engineGroup = FlutterEngineGroup(name: "flKeyboardMain", project: nil)
        engine = engineGroup.makeEngine(withEntrypoint: "flKeyboardMain", libraryURI: nil)
        self.flutterView = FlutterViewController(
            engine: self.engine!,
            nibName: nil,
            bundle: nil)
        self.engine!.run()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad=====")
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
//        let flutterViewController = FlutterViewController(project: nil, initialRoute: "/ext", nibName: nil, bundle: nil)
//        print(flutterViewController.engine)
//        present(flutterViewController, animated: true)
//
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        self.view.addSubview(self.nextKeyboardButton)
    
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
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
}
