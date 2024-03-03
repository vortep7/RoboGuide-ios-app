
import UIKit

class TestsViewController: UIViewController {
    
    var count:Int = 1
    var test: TestsView { return self.view as! TestsView}
    let answer = Answers()
    var digit = 1
    var counter = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        JSONParcer.shared.fetchData()
        
        test.onButtonFirstAction = {[weak self] in self?.actionForButton()}
        test.onButtonFirstAnswer = {[weak self] in self?.actionFirst()}
        test.onButtonSecondAnswer = {[weak self] in self?.actionSecond()}
        test.onButtonThirdAnswer = {[weak self] in self?.actionThird()}
        test.onButtonFourthAnswer = {[weak self] in self?.actionFourth()}
        
        counter = UserDefaults.standard.value(forKey: "counter") as! Int

    }
    
    override func loadView() {
        self.view = TestsView(frame: UIScreen.main.bounds)
    }
    
    //MARK: - action for button
    @objc func actionFirst() {
        test.setupTrueImageFirst()
        count = 1000
        positiveAnswer()
    }
    
    @objc func actionSecond() {
        test.setupTrueImageSecond()
        count = 2000
        positiveAnswer()
    }
    
    @objc func actionThird() {
        test.setupTrueImageThird()
        count = 3000
        positiveAnswer()
    }
    
    @objc func actionFourth() {
        test.setupTrueImageFourth()
        count = 4000
        positiveAnswer()
    }
    
    //MARK: - change question
    @objc func actionForButton() {
        if digit < 5 {
            digit += 1
            test.changeQuestion(digit)
            test.returnImage()
            addButton()
            count = 1
        } else {
            digit = 0
            test.changeQuestion(digit)
            test.returnImage()
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
    func positiveAnswer(){
        var myAnswer = 1
        answer.checkPositiveAnswer(count, &myAnswer)
        let indexOfPositiveAnswer = JSONParcer.shared.arrayOfpositiveAnswers[digit]
        if indexOfPositiveAnswer == myAnswer {
            test.changeText(1)
            counter += 1
            UserDefaults.standard.setValue(counter, forKey: "counter")
            test.changeDigit(counter)
        } else {
            test.changeText(2)
        }
    }
}
