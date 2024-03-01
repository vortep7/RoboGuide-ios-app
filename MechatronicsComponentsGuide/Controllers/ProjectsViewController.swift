//
//  ProjectsViewController.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 01.03.2024.

import UIKit

class ProjectsViewController: UIViewController {
    var project: ProjectsView {return self.view as! ProjectsView}
    //data for collection cell
    let source:[Component] = CollectionSource.createComponents()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: setupLayout())
        collectionView.dataSource = self
        
        project.addSubview(collectionView)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: project.safeAreaLayoutGuide.topAnchor, constant: 70),
            collectionView.bottomAnchor.constraint(equalTo: project.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: project.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: project.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        collectionView.layer.cornerRadius = 18
        let backgroundImage = UIImage(named: "flyRobot")
        let backgroundImageView = UIImageView(image: backgroundImage)
        collectionView.backgroundView = backgroundImageView
    }
    
    //MARK: - create special Layout
    func setupLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 350, height: 350)
        layout.minimumLineSpacing = 60
        layout.collectionView?.backgroundColor = .blue
        return layout
    }
    
    override func loadView() {
        self.view = ProjectsView(frame: UIScreen.main.bounds)
    }
}



extension ProjectsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(CollectionViewCell.self)", for: indexPath) as? CollectionViewCell else {
            print("Ошибка: Не удалось создать ячейку")
            return UICollectionViewCell()
        }
        
        cell.imageView.image = source[indexPath.item].image
        cell.lable.text = source[indexPath.item].title
        
        cell.layer.cornerRadius = 20
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
}


