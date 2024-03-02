
import UIKit

class TestsViewController: UIViewController {
    
    var test: TestsView { return self.view as! TestsView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.onButtonFirstAction = {[weak self] in self?.actionForButton()}

    }
    
    override func loadView() {
        self.view = TestsView(frame: UIScreen.main.bounds)
    }
    
    @objc func actionForButton() {
        if test.digit < 5 {
            test.digit += 1
            test.label.text = JSONParcer.shared.arrayOfText[test.digit]
        } else {
            test.digit = 0
            test.label.text = JSONParcer.shared.arrayOfText[test.digit]
        }
    }
}
