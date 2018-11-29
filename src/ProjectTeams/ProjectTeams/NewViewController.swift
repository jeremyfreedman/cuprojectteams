//
//  NewViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/28/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tab bar
        // Set the background color of view to white.
        view.backgroundColor = UIColor.white
        
        // Define the label.
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 50
        let positionX: CGFloat = (view.bounds.width - buttonWidth)/2
        let positionY: CGFloat = (view.bounds.height - buttonHeight)/2
        let label = UILabel(frame: CGRect(x: positionX, y: positionY, width: buttonWidth, height: buttonHeight))
        label.backgroundColor = UIColor.red
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 20.0
        label.text = "Second View"
        label.textColor = UIColor.white
        label.textAlignment = .center
        
        // Add label to view.
        view.addSubview(label)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
