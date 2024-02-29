import UIKit

class InfoView: UIView {
    
    //MARK: - creating UI elements
    private var CatImage = UIImage()
    
    private let imageView:UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.text = ForText.text.rawValue
        textView.font = UIFont.systemFont(ofSize: 26)
        textView.textColor = .black
        textView.setContentOffset(CGPoint.zero, animated: false) // Установка начального смещения
        return textView
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.text = "Всем привет!"
        label.textColor = .white
        return label
    }()
    
    
    //MARK: - creating constraints
    func constraintForMyLabel() {
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            myLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -600),
            myLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            myLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
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
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -200),
        ])
    }
    
    func constraintsForAllView() {
        constraintForMyLabel()
        constraintForImageView()
        constraintForTextView()
    }
    
    
    //MARK: - add View components
    func addViews() {
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
