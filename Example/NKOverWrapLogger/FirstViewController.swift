import UIKit
import NKOverWrapLogger

class FirstViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NKOverWrapLogger.shared.log("FirstViewController!!")
    }
}

