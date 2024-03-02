//
//  CollectionViewCell.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 01.03.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var lableFirst = UILabel()
    var imageView = UIImageView()
    var lableSecond = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    //MARK: - parametrs of cell
    func setupCell() {
        lableFirst.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(lableFirst)
        
        lableSecond.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(lableSecond)
        
        self.contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -40),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            lableFirst.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            lableFirst.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            lableSecond.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            lableSecond.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
