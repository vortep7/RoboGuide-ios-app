//
//  CollectionViewCell.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 01.03.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var lable = UILabel()
    var imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    //MARK: - parametrs of cell
    func setupCell() {
        lable.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(lable)
        
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            lable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            lable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
