import UIKit
import Foundation

final class TestsView: UIView {
    var onButtonFirstAction: (() ->Void)?
    
    var onButtonFirstAnswer: (() ->Void)?
    var onButtonSecondAnswer: (() ->Void)?
    var onButtonThirdAnswer: (() ->Void)?
    var onButtonFourthAnswer: (() ->Void)?

    var digit = 1
    
    let congrLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "abosanova", size: 22)
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"final")
        return imageView
    }()
    
    private let imageViewMini: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"white")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = UIColor.blue.cgColor
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = Words.firstLabel.rawValue
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 5
        return label
    }()
    
    //MARK: - create answers
    var firstAnswer: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    var secondAnswer: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    var thirdAnswer: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    var fouthrAnswer: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .orange
        return label
    }()
    
    var qualityOfLevel: UILabel = {
        let label = UILabel()
//        label.font = .boldSystemFont(ofSize: 32)
        label.font = UIFont(name: "abosanova", size: 35)
        label.textColor = .white
        return label
    }()
    
    private let button:UIButton = {
        let button = UIButton()
        
        button.setTitle("Next question", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    let checkButtonFirst: UIButton = {
        let checkboxButton = UIButton(type: .custom)
        checkboxButton.setImage(UIImage(named: "unchecked"), for: .normal)
        checkboxButton.isSelected = false
        return checkboxButton
    }()
    
    let checkButtonSecond: UIButton = {
        let checkboxButton = UIButton(type: .custom)
        checkboxButton.setImage(UIImage(named: "unchecked"), for: .normal)
        checkboxButton.isSelected = false
        return checkboxButton
    }()
    
    let checkButtonThird: UIButton = {
        let checkboxButton = UIButton(type: .custom)
        checkboxButton.setImage(UIImage(named: "unchecked"), for: .normal)
        checkboxButton.isSelected = false
        return checkboxButton
    }()
    
    let checkButtonFourth: UIButton = {
        let checkboxButton = UIButton(type: .custom)
        checkboxButton.setImage(UIImage(named: "unchecked"), for: .normal)
        checkboxButton.isSelected = false
        return checkboxButton
    }()

    private let hintButton:UIButton = {
        let button = UIButton()
        button.setTitle("Hint", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 18
        return button
    }()
    
    func constraintsFotCongrLabel() {
        congrLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            congrLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -190),
            congrLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            congrLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintsFotSecondButton() {
        checkButtonSecond.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkButtonSecond.topAnchor.constraint(equalTo: checkButtonFirst.bottomAnchor, constant: 20),
            checkButtonSecond.heightAnchor.constraint(equalToConstant: 40),
            checkButtonSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
            checkButtonSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }

    func constraintsFotThirdButton() {
        checkButtonThird.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkButtonThird.topAnchor.constraint(equalTo: checkButtonSecond.bottomAnchor, constant: 20),
            checkButtonThird.heightAnchor.constraint(equalToConstant: 40),
            checkButtonThird.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
            checkButtonThird.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }

    func constraintsFotFourthButton() {
        checkButtonFourth.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkButtonFourth.topAnchor.constraint(equalTo: checkButtonThird.bottomAnchor, constant: 20),
            checkButtonFourth.heightAnchor.constraint(equalToConstant: 40),
            checkButtonFourth.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
            checkButtonFourth.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }

    func constraintsFotFirstButton() {
        checkButtonFirst.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkButtonFirst.topAnchor.constraint(equalTo: self.topAnchor, constant: 330),
            checkButtonFirst.heightAnchor.constraint(equalToConstant: 40),
            checkButtonFirst.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 320),
            checkButtonFirst.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }

    
    func constraintsFotImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
    func constraintsFotQualityOfLevel() {
        qualityOfLevel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            qualityOfLevel.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            qualityOfLevel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            qualityOfLevel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            qualityOfLevel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70),
        ])
    }
    
    func constraintsFotImageViewMini() {
        imageViewMini.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewMini.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            imageViewMini.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -270),
            imageViewMini.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageViewMini.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func constraintsFotButton() {
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintsFotHintButton() {
        hintButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hintButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            hintButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            hintButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintsFotLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func constraintsForFirstAnswer() {
        firstAnswer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstAnswer.topAnchor.constraint(equalTo: self.topAnchor, constant: 300),
            firstAnswer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -450),
            firstAnswer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            firstAnswer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func constraintsForSecondAnswer() {
        secondAnswer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondAnswer.topAnchor.constraint(equalTo: self.topAnchor, constant: 355),
            secondAnswer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -390),
            secondAnswer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            secondAnswer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func constraintsForThirdAnswer() {
        thirdAnswer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            thirdAnswer.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            thirdAnswer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -330),
            thirdAnswer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            thirdAnswer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func constraintsForFouthrAnswer() {
        fouthrAnswer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            fouthrAnswer.topAnchor.constraint(equalTo: self.topAnchor, constant: 460),
            fouthrAnswer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -270),
            fouthrAnswer.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            fouthrAnswer.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func createConstraints() {
        constraintsFotImageView()
        constraintsFotImageViewMini()
        constraintsFotLabel()
        constraintsFotButton()
        constraintsForFirstAnswer()
        constraintsForSecondAnswer()
        constraintsForThirdAnswer()
        constraintsForFouthrAnswer()
        constraintsFotHintButton()
        constraintsFotQualityOfLevel()
    }
    
    func addViews() {
        self.addSubview(imageView)
        self.addSubview(imageViewMini)
        self.addSubview(label)
        self.addSubview(button)
        self.addSubview(firstAnswer)
        self.addSubview(secondAnswer)
        self.addSubview(thirdAnswer)
        self.addSubview(fouthrAnswer)
        self.addSubview(hintButton)
        self.addSubview(qualityOfLevel)
    }
    
    func setupButtons() {
        self.addSubview(checkButtonFirst)
        self.addSubview(checkButtonSecond)
        self.addSubview(checkButtonThird)
        self.addSubview(checkButtonFourth)
        self.addSubview(congrLabel)

        constraintsFotFirstButton()
        constraintsFotSecondButton()
        constraintsFotThirdButton()
        constraintsFotFourthButton()
        constraintsFotCongrLabel()
    }
    
    func addAction() {
        button.addTarget(self, action: #selector(onFirstAction), for: .touchUpInside)
        
        checkButtonFirst.addTarget(self, action: #selector(checkButtonFirstAction), for: .touchUpInside)
        checkButtonSecond.addTarget(self, action: #selector(checkButtonSecondAction), for: .touchUpInside)
        checkButtonThird.addTarget(self, action: #selector(checkButtonThirdAction), for: .touchUpInside)
        checkButtonFourth.addTarget(self, action: #selector(checkButtonFourthAction), for: .touchUpInside)

    }
    
    @objc func onFirstAction() {
        onButtonFirstAction?()
    }
    
    @objc func checkButtonFirstAction() {
        onButtonFirstAnswer?()
    }
    
    @objc func checkButtonSecondAction() {
        onButtonSecondAnswer?()
    }
    
    @objc func checkButtonThirdAction() {
        onButtonThirdAnswer?()
    }
    
    @objc func checkButtonFourthAction() {
        onButtonFourthAnswer?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        createConstraints()
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

enum Words: String {
    case firstLabel = "This is funny RoboTest! Choose the correct answer from among the suggested ones. Points are awarded for correct answers. Good luck, young roboticist!"
}
