import Flutter
import UIKit

class KeyboardViewController: UIInputViewController {
    override func updateViewConstraints() {
        super.updateViewConstraints()
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let engineGroup = FlutterEngineGroup(name: "flKeyboardMain", project: FlutterDartProject(precompiledDartBundle: Bundle(for: Self.self)))
        let engine = engineGroup.makeEngine(withEntrypoint: "flKeyboardMain", libraryURI: nil)
//        let engine = FlutterEngine()
        engine.run()
        let flutterView = FlutterViewController(engine: engine, nibName: nil, bundle: nil)
        let stackView = UIStackView()
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        stackView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        stackView.backgroundColor = UIColor.red
        stackView.addSubview(flutterView.view)
//        self.view.addSubview(stackView)
        self.view.addSubview(flutterView.view)
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
