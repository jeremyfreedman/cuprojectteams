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
    let emptyAlert = UIAlertController(title: "Invalid entry!", message: "Arena name cannot by empty!", preferredStyle: .alert)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //let vc = MainViewController()
    //vc.pushBlueViewControllerButton: UIButton!
    // weak var delegate: ChangeButtonTitleDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.inputText.delegate = self
        view.backgroundColor = .white
        title = "Blue Square Arena"
        //appDelegate.blueArenaTitle = "Blue Square Arena"
        emptyAlert.addAction(UIAlertAction(title: "Understood.", style: .default, handler: nil))
        blueView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        blueView.layer.cornerRadius = 50
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        
        textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = title
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.textAlignment = .center
        view.addSubview(textField)
        
        button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Arena Name:", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        
        // When the button is pressed, dismiss this ModalViewController and change the button name
        button.addTarget(self, action: #selector(updateArena), for: .touchUpInside)
        view.addSubview(button)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textField.heightAnchor.constraint(equalToConstant: 24),
            textField.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            button.heightAnchor.constraint(equalToConstant: 24),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -30)
            ])
    }
    
    @objc func updateArena() {
        let text = textField.text
        if let actualText = text, actualText != "" {
            title = text
            textField.placeholder = title
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // self.view.isMultipleTouchEnabled = true
        for touch in touches {
            // Set the Center of the square
            let blueViewCenter = touch.location(in: view)
            let blueView = UIView(frame: CGRect(x: blueViewCenter.x, y: blueViewCenter.y, width: 50, height: 50))
            // www.hackingwithswift.com/example-code/calayer/how-to-round-the-corners-of-a-uiview
            blueView.layer.cornerRadius = 25
            blueView.backgroundColor = .blue
            view.addSubview(blueView)
        }
    }
    
    // makeapppie.com/2018/03/14/tip-creating-navigation-controllers/
    @objc func saveTapped(sender: UIBarButtonItem) {
        //let mainViewController = MainViewController()
        //navigationController?.pushViewController(mainViewController, animated: true)
        if self.textField.text == "" {    // textField empty
            self.present(emptyAlert, animated: true)     // popup alert
        }
        navigationController?.popToRootViewController(animated: true)   // pop RedViewController
        title = textField.text
    }
}
