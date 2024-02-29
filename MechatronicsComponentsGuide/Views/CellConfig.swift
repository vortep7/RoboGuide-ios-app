import UIKit
import Foundation

class ReferenceCell: UITableViewCell {
    //MARK: - Items in cell
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let discriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    let reference: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    
    //MARK: - setting up a cell
    func setupCell() {
        let array = [nameLabel,discriptionLabel,reference]
        
        array.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            discriptionLabel.topAnchor.constraint(equalTo:nameLabel.bottomAnchor),
            discriptionLabel.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 8),
            discriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            discriptionLabel.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8),
            
            reference.topAnchor.constraint(equalTo:contentView.topAnchor, constant: 10),
            reference.leadingAnchor.constraint (equalTo: contentView.leadingAnchor, constant: 30),
            reference.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            reference.bottomAnchor.constraint (equalTo: contentView.bottomAnchor, constant: -8)])
    }
    
    func configure(author: Author) {
        nameLabel.text = author.name
        discriptionLabel.text = author.review
    }
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
