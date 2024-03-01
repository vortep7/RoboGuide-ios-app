import UIKit

final class ProjectsView: UIView {
    
    //MARK: - add UI elements
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flyRobot")
        return imageView
    }()
    
    
    //MARK: - add constraints
    private func constraintForImageView() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func createConstraint() {
        constraintForImageView()
    }
    
    //MARK: - add Views
    private func addViews() {
        self.addSubview(imageView)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addViews()
        createConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
