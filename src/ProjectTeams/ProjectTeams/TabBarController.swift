//
//  TabBarController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/28/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        var viewControllers: [UIViewController] = []
        
        // Create an instance of ViewController to set in first tab.
        let firstViewController = ViewController()
        firstViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostRecent, tag: 1)
        viewControllers.append(firstViewController)
        
        // Create an instance of ViewController to set in second tab.
        let secondViewController = NewViewController()
        secondViewController.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarItem.SystemItem.mostViewed, tag: 2)
        viewControllers.append(secondViewController)
        
        // Set ViewController.
        setViewControllers(viewControllers, animated: false)
        
        // Set tab whose tag is 0 as selected tab
        self.selectedIndex = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

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
