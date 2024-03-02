//
//  MainView.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 29.02.2024.
//

import UIKit

final class MainView: UIView {
    
    //MARK: - crating clousers
    var onButtonFirstAction: (() ->Void)?
    var onButtonSecondAction: (() ->Void)?
    var onButtonThirdAction: (() ->Void)?
    
    
    //MARK: - creating UI elements
    
    private let firstLabel:UILabel = {
        let label = UILabel()
        label.text = "RoboGuide"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)

        return label
    }()
    
    private let imageView: UIImageView = {
        let mainImage = UIImage(named: "robots")
        let imageView = UIImageView()
        imageView.image = mainImage
        return imageView
    }()
    
    private let generalImage: UIImageView = {
        let image = UIImage(named: "robo")
        let generalImage = UIImageView()
        generalImage.image = image
        return generalImage
    }()
    
    private var buttonFirst: UIButton = {
        var button = UIButton()
        button.setTitleColor(.cyan, for: .highlighted)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 25
        
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5) // Смещение тени по горизонтали и вертикали
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.8 // Прозрачность тени
        
        button.backgroundColor = .lightGray
        button.setTitle(textForView.firstButton.rawValue, for: .normal)
        return button
    }()
    private let buttonSecond: UIButton = {
        var button = UIButton()
        button.setTitle(textForView.secondButton.rawValue, for: .normal)
        
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5) // Смещение тени по горизонтали и вертикали
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.8 // Прозрачность тени
        
        button.setTitleColor(.white, for: .normal)
        button.setTitleColor(.cyan, for: .highlighted)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 25
        return button
    }()
    private let buttonThird: UIButton = {
        var button = UIButton()
        button.setTitle(textForView.thirdButton.rawValue, for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 2
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5) // Смещение тени по горизонтали и вертикали
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.8 // Прозрачность тени
        
        button.setTitleColor(.cyan, for: .highlighted)
        button.backgroundColor = .systemPink
        button.layer.cornerRadius = 25
        return button
    }()
    
    
    //MARK: - Function for actions
    func addActions() {
        buttonFirst.addTarget(self, action: #selector(FirstAction), for: .touchUpInside)
        buttonSecond.addTarget(self, action: #selector(SecondAction), for: .touchUpInside)
        buttonThird.addTarget(self, action: #selector(ThirdAction), for: .touchUpInside)
    }
    
    @objc func FirstAction() {
        onButtonFirstAction?()
    }
    
    @objc func SecondAction() {
        onButtonSecondAction?()
    }
    
    @objc func ThirdAction() {
        onButtonThirdAction?()
    }
    
    //MARK: - Function for addView
    func addViews() {
        self.addSubview(imageView)
        self.addSubview(generalImage)
        self.addSubview(buttonFirst)
        self.addSubview(buttonSecond)
        self.addSubview(buttonThird)
        self.addSubview(firstLabel)
    }
    
    //MARK: - Function for constraints
    func constraintsForButtons() {
        buttonFirst.translatesAutoresizingMaskIntoConstraints = false
        buttonSecond.translatesAutoresizingMaskIntoConstraints = false
        buttonThird.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonFirst.topAnchor.constraint(equalTo: self.topAnchor, constant: 70),
            buttonFirst.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -730),
            buttonFirst.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 240),
            buttonFirst.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),

            buttonSecond.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            buttonSecond.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -250),
            buttonSecond.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            buttonSecond.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90),
        
            buttonThird.topAnchor.constraint(equalTo: self.topAnchor, constant: 650),
            buttonThird.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            buttonThird.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 90),
            buttonThird.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -90)
        ])
    }
    
    func constraintsForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
    func constraintsForGeneralImage() {
        generalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            generalImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 150),
            generalImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -450),
            generalImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80),
            generalImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80),
        ])
    }
    
    func constraintsForFirstImage() {
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            firstLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 310),
            firstLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -330),
            firstLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            firstLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    func constraintsForAllViews() {
        constraintsForButtons()
        constraintsForImageView()
        constraintsForGeneralImage()
        constraintsForFirstImage()
    }
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        constraintsForAllViews()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


enum textForView: String {
    case firstButton = "About me"
    case secondButton = "Useful information"
    case thirdButton = "General view"
}
