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
        project.collectionView.dataSource = self
        project.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "\(CollectionViewCell.self)")
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
        cell.lableFirst.text = source[indexPath.item].title
        cell.lableSecond.text = source[indexPath.item].review

        
        cell.layer.cornerRadius = 20
        
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        return cell
    }
}


