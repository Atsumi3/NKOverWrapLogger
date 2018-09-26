
import UIKit

public class NKOverWrapLogger: UIView {
    private static let DEFAULT_VIEW_MARGIN: Int = 16
    private static var instance: NKOverWrapLogger?
    public static var shared: NKOverWrapLogger {
        if instance == nil {
            instance = NKOverWrapLogger(frame: CGRect.zero)
        }
        return instance!
    }
    
    private static let uiWindowObserver = UIWindowObserver()
    
    private var textView: UITextView = UITextView(frame: CGRect.zero)
    
    var viewMargin: Int = DEFAULT_VIEW_MARGIN {
        didSet {
            updateViews()
        }
    }
    
    public static func setup(uiWindowHoldingObject: NSObject, key: String) {
        uiWindowHoldingObject.addObserver(uiWindowObserver,
                                          forKeyPath: key,
                                          options: [.initial, .new], context: nil)
    }
    
    private var loggingText: String = "" {
        didSet {
            textView.text = loggingText
            scrollToBottom()
        }
    }
    
    public func log(_ message: String) {
        loggingText = loggingText + message + "\n"
    }
    
    private override init(frame: CGRect) {
        super.init(frame: frame)
        initOnce()
        updateViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initOnce()
        updateViews()
    }
    
    private func initOnce() {
        addSubview(textView)
        
        tag = Int.max
        
        layer.cornerRadius = 2
        layer.masksToBounds = true
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.zPosition = .greatestFiniteMagnitude
        
        backgroundColor = UIColor.white
        isUserInteractionEnabled = false
        alpha = 0.5
    }
    
    private func updateViews() {
        let parentFrame: CGRect = UIScreen.main.bounds
        let loggerViewFrame: CGRect = CGRect(x: viewMargin,
                                             y: viewMargin,
                                             width: Int(parentFrame.maxX) - (viewMargin * 2),
                                             height: Int(parentFrame.maxY) - (viewMargin * 2))
        frame = loggerViewFrame
        
        textView.frame = CGRect(x: 0, y: 0, width: loggerViewFrame.width, height: loggerViewFrame.height)
        textView.text = loggingText
        scrollToBottom()
        
        layoutIfNeeded()
    }
    
    func scrollToBottom() {
        if textView.text.count > 0 {
            let location = textView.text.count - 1
            let bottom = NSMakeRange(location, 1)
            textView.scrollRangeToVisible(bottom)
        }
    }
    
    private class UIWindowObserver: NSObject {
        override func observeValue(forKeyPath keyPath: String?,
                                   of object: Any?, change: [NSKeyValueChangeKey: Any]?,
                                   context: UnsafeMutableRawPointer?) {
            guard let window = change?[.newKey] as? UIWindow else {
                return
            }
            
            DispatchQueue.main.async {
                if window.subviews.contains(NKOverWrapLogger.shared) {
                    NKOverWrapLogger.shared.removeFromSuperview()
                }
                window.addSubview(NKOverWrapLogger.shared)
            }
        }
    }
}
