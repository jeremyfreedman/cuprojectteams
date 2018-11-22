//
//  ViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/21/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupConstraints() {
        
    }
    
    @objc func pushAppDevViewController() {
        let appDevViewController = AppDevViewController()
        navigationController?.pushViewController(appDevViewController, animated: true)
    }


}

