import Flutter
import UIKit

open class FlKeyboardController: UIInputViewController {
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
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad=====")
        self.view.addSubview(self.flutterView!.view)
        
//        self.nextKeyboardButton = UIButton(type: .system)
//
//        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
//
//        self.view.addSubview(self.nextKeyboardButton)
//
//        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
//        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    override public func updateViewConstraints() {
        super.updateViewConstraints()
        print("updateViewConstraints=====")
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviews=====")
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
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
