import UIKit
import Foundation

final class TestsView: UIView {
    var onButtonFirstAction: (() ->Void)?
    var digit = 1
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named:"magic")
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
        JSONParcer.shared.fetchData()
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
    
    func constraintsFotImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
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
//            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -100),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
        ])
    }
    
    func constraintsFotLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 190),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -510),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
    func createConstraints() {
        constraintsFotImageView()
        constraintsFotImageViewMini()
        constraintsFotLabel()
        constraintsFotButton()
    }
    
    func addViews() {
        self.addSubview(imageView)
        self.addSubview(imageViewMini)
        self.addSubview(label)
        self.addSubview(button)
    }
    
    func addAction() {
        button.addTarget(self, action: #selector(onFirstAction), for: .touchUpInside)
    }
    
    @objc func onFirstAction() {
        onButtonFirstAction?()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.text = JSONParcer.shared.arrayOfText[digit]

        addViews()
        createConstraints()
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
