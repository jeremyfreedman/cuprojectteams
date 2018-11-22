//
//  ViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/21/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let teamCell = "teamCell"
    let headerView = "headerView"
    let headerHeight: CGFloat = 30
    var refreshControl: UIRefreshControl!
    
    // Array of each Team (project team)
    let restaurants = [Team(image: "", name: "", type: ""),
                       Team(image: "", name: "", type: ""),
                       Team(image: "", name: "", type: ""),
                       // ..... etc.
    ]
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        collectionView? = UICollectionView(frame: .zero, collectionViewLayout: layout)
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        collectionView?.backgroundColor = UIColor(hue: 0.0722, saturation: 0, brightness: 0.93, alpha: 1.0)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.refreshControl = refreshControl
        
        navigationItem.title = "Project Team"
        navigationController?.navigationBar.barTintColor = .white
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                   NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        
        self.view.addSubview(scrollView)
        //Header collectionView
        let layoutB = UICollectionViewFlowLayout()
        layoutB.scrollDirection = .horizontal
        let collectionViewB = UICollectionView(frame: .zero, collectionViewLayout: layoutB)
        //let filterLayoutB = UICollectionViewFlowLayout()
        //collectionViewB.backgroundColor = UIColor(hue: 0.0722, saturation: 0, brightness: 0.93, alpha: 1.0)
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        
        self.view.addSubview(collectionView)
        self.view.addSubview(collectionViewB)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCell, for: indexPath) as! TeamsCollectionViewCell
        cell.team = restaurants[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 2) - 16, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
    
    @objc func pulledToRefresh() {
        // Place some code here that fetches new data
        // Then call refreshControl.endRefreshing() once we get that data back
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }
    
}
