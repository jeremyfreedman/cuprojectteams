//
//  AppDevViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/21/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class AppDevViewController: UIViewController {
    var blueView: UIView!
    var textField: UITextField!
    var button: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //let vc = MainViewController()
    //vc.pushBlueViewControllerButton: UIButton!
    // weak var delegate: ChangeButtonTitleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            ])
    }
    
}
