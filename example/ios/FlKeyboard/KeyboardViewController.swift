import Flutter
import UIKit

class KeyboardViewController: UIInputViewController {
    private var stackView = UIStackView()
    public var engine: FlutterEngine?
    public var flutterView: FlutterViewController?
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let engineGroup = FlutterEngineGroup(name: "flKeyboardMain", project: nil)
        engine = engineGroup.makeEngine(withEntrypoint: "flKeyboardMain", libraryURI: nil)
        self.flutterView = FlutterViewController(
            engine: self.engine!,
            nibName: nil,
            bundle: nil)
        self.engine!.run()
        // 获取屏幕的宽度和高度
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        self.stackView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        self.stackView.backgroundColor = UIColor.red
//        present(self.flutterView!, animated: true, completion: nil)
//        self.stackView.addSubview(self.flutterView!.view)
        self.view.addSubview(self.stackView)
    }
    
    override func viewWillLayoutSubviews() {
//        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
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
//        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
}
