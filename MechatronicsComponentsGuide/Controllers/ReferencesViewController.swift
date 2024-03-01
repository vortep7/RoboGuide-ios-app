//
//  ReferencesViewController.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 29.02.2024.
//

import UIKit

class ReferencesViewController: UIViewController {
    let authors = Source.createAuthor()
    var referenceView: ReferencesView {return self.view as! ReferencesView}

    override func viewDidLoad() {
        super.viewDidLoad()
        referenceView.tableView.delegate = self
        referenceView.tableView.dataSource = self
        referenceView.tableView.register(ReferenceCell.self, forCellReuseIdentifier: "AuthorCell")

    }
    
    override func loadView() {
        self.view = ReferencesView(frame: UIScreen.main.bounds)
    }
}


//MARK: - delegate for cells
extension ReferencesViewController: UITableViewDelegate  {
    //MARK: - action for cells
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alert = UIAlertController(title: "Nice choose!!", message: "Reference: ", preferredStyle: .alert)
            let actionForAlert = UIAlertAction(title: "Ok,thanks!", style: .cancel)
            alert.addAction(actionForAlert)
            present(alert, animated: true, completion: nil)
        case 1:
            let alert = UIAlertController(title: "Nice choose!!", message: "Reference: ", preferredStyle: .alert)
            let actionForAlert = UIAlertAction(title: "Ok,thanks!", style: .cancel)
            alert.addAction(actionForAlert)
            present(alert, animated: true, completion: nil)
        case 2:
            let alert = UIAlertController(title: "Nice choose!!", message: "Reference: ", preferredStyle: .alert)
            let actionForAlert = UIAlertAction(title: "Ok,thanks!", style: .cancel)
            alert.addAction(actionForAlert)
            present(alert, animated: true, completion: nil)
        default:
            let alert = UIAlertController(title: "OppS!", message: "No reference", preferredStyle: .alert)
            let actionForAlert = UIAlertAction(title: "cancel", style: .cancel)
            alert.addAction(actionForAlert)
            present(alert, animated: true, completion: nil)
        }
    }
}

//MARK: - data source for cells (custom and config)
extension ReferencesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        authors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath) as? ReferenceCell
        else {fatalError()}
        cell.configure(author: authors[indexPath.row])
        
        cell.tintColor = .red
        return cell
    }
    
    
    //MARK: - custom cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .systemBlue
        
        let label = UILabel()
        label.text = "Really useful tools for studing"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -8)
        ])
        
        return headerView
    }
}

