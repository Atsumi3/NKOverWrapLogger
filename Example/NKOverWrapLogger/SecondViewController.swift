import UIKit
import NKOverWrapLogger

class SecondViewController: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NKOverWrapLogger.shared.log("SecondViewController!!")
    }
    @IBAction func onGoBackClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
