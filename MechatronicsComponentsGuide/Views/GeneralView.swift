

import Foundation
import UIKit

final class GeneralView: UIView {
    //MARK: - create clouser
    var onAddActionFirstButton: (() -> Void)?
    var onAddActionSecondButton: (() -> Void)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "abosanova", size: 25)
        label.text = "USEFUL TOOLS FOR ROBOTS"
        return label
    }()
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cuteRobots")
        return imageView
    }()
    
    private let buttonCode: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.8
        button.alpha = 1
        button.setTitle(textForButtons.firstButtonText.rawValue, for: .normal)
        
        return button
    }()
    
    private let constructButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.8
        button.alpha = 1
        button.setTitle(textForButtons.secondButtonText.rawValue, for: .normal)
        
        return button
    }()
    
    //MARK: - create Constraint
    func constraintForButtonCode() {
        buttonCode.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonCode.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            buttonCode.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -300),
            buttonCode.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            buttonCode.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func constraintForButtonConstruct() {
        constructButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            constructButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 600),
            constructButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            constructButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            constructButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -70)
        ])
    }
    
    func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    
    func constraintForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    func createConstraint() {
        constraintForImageView()
        constraintForButtonCode()
        constraintForButtonConstruct()
        constraintForLabel()
    }
    
    //MARK: - addViews
    func addView() {
        self.addSubview(imageView)
        self.addSubview(buttonCode)
        self.addSubview(constructButton)
        self.addSubview(label)
        
    }
    
    //MARK: - add tasks
    func addTasks() {
        buttonCode.addTarget(self , action: #selector(firstAction), for: .touchUpInside)
        constructButton.addTarget(self, action: #selector(secondAction), for: .touchUpInside)
    }
    
    @objc func firstAction() {
        onAddActionFirstButton?()
    }
    
    @objc func secondAction() {
        onAddActionSecondButton?()
    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addView()
        createConstraint()
        addTasks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


//MARK: - enum for button titles
enum textForButtons: String {
    case firstButtonText = "MarketForComponents"
    case secondButtonText = "Project(Beginner-Pro)"
}

