import UIKit

final class ProjectsView: UIView {
    
    //MARK: - create UI elements
    let imageView:UIImageView = {
        let imageView  = UIImageView()
        imageView.image = UIImage(named: "rer")
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Data base interesting robo-projects"
        label.font = .boldSystemFont(ofSize: 25)
        label.numberOfLines = 2
        return label
    }()
    
    let imageViewMini:UIImageView = {
        let imageView  = UIImageView()
        imageView.image = UIImage(named: "iftis")
        return imageView
    }()
        
    let collectionView: UICollectionView
    //MARK: - create constraints
    func constraintsForCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -20),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: 0),
        ])
    }
    
    func constraintsForLabel() {
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 50),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -670),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 30),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
        ])
    }
    
    func constraintsForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 0),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: 0),
        ])
    }
    
    func constraintsForImageViewMini() {
        imageViewMini.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageViewMini.topAnchor.constraint(equalTo: self.topAnchor, constant: 80),
            imageViewMini.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -710),
            imageViewMini.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 290),
            imageViewMini.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -30),
        ])
    }
    
    func createConstraints() {
        constraintsForImageView()
        constraintsForCollectionView()
        constraintsForLabel()
        constraintsForImageViewMini()
    }
    
    //MARK: - add Views
    func addView() {
        self.addSubview(imageView)
        self.addSubview(collectionView)
        self.addSubview(label)
        self.addSubview(imageViewMini)
    }

    
    override init(frame: CGRect) {
        let layout = ProjectsView.setupLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        super.init(frame: frame)
        addView()
        createConstraints()
        
        collectionView.layer.cornerRadius = 18
        collectionView.backgroundColor = .blue
        let backgroundImage = UIImage(named: "flyRobot")
        let backgroundImageView = UIImageView(image: backgroundImage)
        collectionView.backgroundView = backgroundImageView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private static func setupLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 380)
        layout.minimumLineSpacing = 100
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10) 
        return layout
    }
}

