
import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        self.view = InfoView(frame: UIScreen.main.bounds)
    }
}
