import UIKit
import WebKit

final class ReferencesView: UIView {
    
    //MARK: - create Ui elements
    
    lazy var webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    private let newImageView: UIImageView = {
        let imageViwe = UIImageView()
        imageViwe.image = UIImage(named: "mephi")
        return imageViwe
    }()
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 25
        tableView.layer.borderWidth = 2.0 
        tableView.layer.borderColor = UIColor.blue.cgColor
        return tableView
    }()
    
    private let generalViewImage: UIImageView = {
        let viewImage = UIImageView()
        viewImage.image = UIImage(named: "robotCell")
        return viewImage
    }()
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.text = "Information about robots and their components"
        lable.textColor = .white
        lable.font = .systemFont(ofSize: 16)
        return lable
    }()
    
    //MARK: - constraints for UI
    func constraintsForTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }
    
    func constraintForGeneralViewImage() {
        generalViewImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            generalViewImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            generalViewImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            generalViewImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            generalViewImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
        ])
    }
    
    func constraintForlable() {
        lable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lable.topAnchor.constraint(equalTo: self.topAnchor, constant: 180),
            lable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -570),
            lable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            lable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }
    
    func constraintForNewImageView() {
        newImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
            newImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -650),
            newImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 120),
            newImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -120)
        ])
    }

    
    func addConstraints() {
        constraintForGeneralViewImage()
        constraintsForTableView()
        constraintForlable()
        constraintForGeneralViewImage()
        constraintForNewImageView()
    }
    
    
    
    //MARK: - addViewForScreen
    func addViews() {
        self.addSubview(generalViewImage)
        self.addSubview(tableView)
        self.addSubview(lable)
        self.addSubview(newImageView)

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
