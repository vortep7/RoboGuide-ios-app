import UIKit

class InfoView: UIView {
    
    //MARK: - creating UI elements
    private var CatImage = UIImage()
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let generalImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "aboutMe")
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = ForText.text.rawValue
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.layer.cornerRadius = 20
        textView.layer.borderColor = UIColor.magenta.cgColor
        textView.textColor = .black
        textView.setContentOffset(CGPoint.zero, animated: false) // Установка начального смещения
        return textView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26)
        label.text = "Cat mood:"
        label.textColor = .systemPink
        return label
    }()
    
    
    //MARK: - creating constraints
    func constraintForMyLabel() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 500),
            myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -200),
            myLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            myLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -150),
        ])
    }
    
    
    func constraintForTextView() {
        textView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -500),
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    
    func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 400),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -70),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 150),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    func constraintForGeneralImageView() {
        generalImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            generalImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            generalImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            generalImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            generalImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
    
    func constraintsForAllView() {
        constraintForMyLabel()
        constraintForImageView()
        constraintForTextView()
        constraintForGeneralImageView()
    }
    
    
    //MARK: - add View components
    func addViews() {
        self.addSubview(generalImageView)
        self.addSubview(myLabel)
        self.addSubview(imageView)
        self.addSubview(textView)
    }
    
    //MARK: - Network Sevice
    func uploadImage() {
        NetworkImageService.shared.fetchCatImage { [weak self] image in
            guard let self = self else { return }
            if let image = image {
                DispatchQueue.main.async {
                    self.CatImage = image
                    self.imageView.image = self.CatImage
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        uploadImage()
        addViews()
        constraintsForAllView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

enum ForText: String {
    case text = "Привет! Я - Андрей, студент МИФИ. Создал это приложение, чтобы делиться с вами нашими проектами, особенно в области робототехники. Здесь вы найдете множество увлекательных работ, которые мы сделали. Давайте вместе погрузимся в мир инноваций и открытий!"
}
