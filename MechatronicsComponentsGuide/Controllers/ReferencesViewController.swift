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

        self.view.backgroundColor = .systemGray
    }
    
    override func loadView() {
        self.view = ReferencesView(frame: UIScreen.main.bounds)
    }
}

extension ReferencesViewController: UITableViewDelegate  {
}

extension ReferencesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        authors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AuthorCell", for: indexPath) as? ReferenceCell
        else {fatalError()}
        cell.configure(author: authors[indexPath.row])
        return cell
    }
}
