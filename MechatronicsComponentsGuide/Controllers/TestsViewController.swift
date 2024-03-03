
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
            JSONParcer.shared.fetchData()
            print(JSONParcer.shared.arrayOfText)
            print(JSONParcer.shared.arrayOfAnswer)
            test.label.text = JSONParcer.shared.arrayOfText[test.digit]
            
            test.firstAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][0]
            test.secondAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][1]
            test.thirdAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][2]
            test.fouthrAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][3]
            
            test.qualityOfLevel.text = JSONParcer.shared.arrayOfLevel[test.digit]
        } else {
            test.digit = 0
            test.label.text = JSONParcer.shared.arrayOfText[test.digit]
            test.firstAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][0]
            test.secondAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][1]
            test.thirdAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][2]
            test.fouthrAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][3]
        }
    }
}
