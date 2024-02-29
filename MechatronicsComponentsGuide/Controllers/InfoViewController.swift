//
//  InfoViewController.swift
//  MechatronicsComponentsGuide
//
//  Created by Андрей Петров on 29.02.2024.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .lightGray

    }
    
    override func loadView() {
        self.view = InfoView(frame: UIScreen.main.bounds)
    }
}
