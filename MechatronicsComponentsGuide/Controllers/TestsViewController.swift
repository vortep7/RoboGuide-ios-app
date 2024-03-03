
import UIKit

class TestsViewController: UIViewController {
    
    var count:Int = 1
    var test: TestsView { return self.view as! TestsView}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test.onButtonFirstAction = {[weak self] in self?.actionForButton()}
        
        test.onButtonFirstAnswer = {[weak self] in self?.actionFirst()}
        test.onButtonSecondAnswer = {[weak self] in self?.actionSecond()}
        test.onButtonThirdAnswer = {[weak self] in self?.actionThird()}
        test.onButtonFourthAnswer = {[weak self] in self?.actionFourth()}

    }
    
    override func loadView() {
        self.view = TestsView(frame: UIScreen.main.bounds)
    }
    
    @objc func actionFirst() {
        test.checkButtonFirst.setImage(UIImage(named: "yes"), for: .normal)
        count = 1000
        answer()
    }
    
    @objc func actionSecond() {
        test.checkButtonSecond.setImage(UIImage(named: "yes"), for: .normal)
        count = 2000
        answer()
    }
    
    @objc func actionThird() {
        test.checkButtonThird.setImage(UIImage(named: "yes"), for: .normal)
        count = 3000
        answer()
    }
    
    @objc func actionFourth() {
        test.checkButtonFourth.setImage(UIImage(named: "yes"), for: .normal)
        count = 4000
        answer()
    }
    
    @objc func actionForButton() {
        if test.digit < 5 {
            test.digit += 1
            JSONParcer.shared.fetchData()
            
            test.label.text = JSONParcer.shared.arrayOfText[test.digit]
            
            test.firstAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][0]
            test.secondAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][1]
            test.thirdAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][2]
            test.fouthrAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][3]
            
            test.qualityOfLevel.text = JSONParcer.shared.arrayOfLevel[test.digit]
            
            returnImage()
            addButton()
            count = 1
        } else {
            test.digit = 0
            test.label.text = JSONParcer.shared.arrayOfText[test.digit]
            test.firstAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][0]
            test.secondAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][1]
            test.thirdAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][2]
            test.fouthrAnswer.text = JSONParcer.shared.arrayOfAnswer[test.digit][3]
            returnImage()
            count = 1
        }
    }
}

extension TestsViewController {
    func addButton() {
        test.setupButtons()
    }
}

extension TestsViewController {
    func returnImage() {
        test.checkButtonFirst.setImage(UIImage(named: "unchecked"), for: .normal)
        test.checkButtonSecond.setImage(UIImage(named: "unchecked"), for: .normal)
        test.checkButtonThird.setImage(UIImage(named: "unchecked"), for: .normal)
        test.checkButtonFourth.setImage(UIImage(named: "unchecked"), for: .normal)
    }
}

extension TestsViewController {
    func answer(){
        var myAnswer = 0
        switch count {
        case 1000:
            myAnswer = 1
        case 2000:
            myAnswer = 2
        case 3000:
            myAnswer = 3
        case 4000:
            myAnswer = 4
        default:
            myAnswer = 999
        }
        
        let indexOfPositiveAnswer = JSONParcer.shared.arrayOfpositiveAnswers[test.digit]
        if indexOfPositiveAnswer == myAnswer {
            test.congrLabel.text = "Well done! Right answer!"
        } else {
            test.congrLabel.text = "The answer is wrong"
        }
    }
}
