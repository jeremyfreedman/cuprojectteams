//
//  ViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/21/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let teamCell = "teamCell"
    let filterCell = "filterCell"
    let headerView = "headerView"
    var headerView2: HeaderView!
    let filterReuseIdentifier = "filterReuseIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let headerHeight: CGFloat = 30
    var refreshControl: UIRefreshControl!
    let filterBarHeight: CGFloat = 30
    
    var vc2 = ProjectTeamViewController()
    
    let teams = [Team(image: "appdev", name: "Cornell AppDev", type: "type"),
                       Team(image: "", name: "AguaClara", type: "type"),
                       Team(image: "", name: "Big Red Bridges", type: "type"),
                       Team(image: "", name: "Cornell ACM Programming", type: "type"),
                       Team(image: "", name: "Cornell Baja SAE", type: "type"),
                       Team(image: "", name: "Cornell ChemE Car", type: "type"),
                       Team(image: "", name: "Cornell Concrete Canoe", type: "type"),
                       Team(image: "", name: "Cornell Cup Robotics", type: "type"),
                       Team(image: "", name: "Cornell Data Science", type: "type"),
                       Team(image: "", name: "Cornell Design & Tech Initiative", type: "type"),
                       Team(image: "", name: "Cornell Engineering World Health", type: "type"),
                       Team(image: "", name: "CGEM", type: "type"),
                       Team(image: "", name: "Cornell Hyperloop", type: "type"),
                       Team(image: "", name: "Cornell Mars Rover", type: "type"),
                       Team(image: "", name: "Cornell Micro-g", type: "type"),
                       Team(image: "", name: "Cornell Racing", type: "type"),
                       Team(image: "", name: "Cornell Rocketry Team", type: "type"),
                       Team(image: "", name: "Cornell Seismic Design", type: "type"),
                       Team(image: "", name: "CUAUV", type: "type"),
                       Team(image: "", name: "Cornell University DEBUT", type: "type"),
                       Team(image: "", name: "CUAir", type: "type"),
                       Team(image: "", name: "CU Autonomous Bicycle", type: "type"),
                       Team(image: "", name: "CU Sail", type: "type"),
                       Team(image: "", name: "CU Solar Boat", type: "type"),
                       Team(image: "", name: "Design Build Fly", type: "type"),
                       Team(image: "", name: "Engineers for a Sustainable World", type: "type"),
                       Team(image: "", name: "Engineers Without Borders", type: "type"),
                       Team(image: "", name: "Resistance Racing", type: "type"),
                       Team(image: "", name: "Steel Bridge", type: "type")]
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // tab bar
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
        label.text = "First View"
        label.textColor = UIColor.white
        label.textAlignment = .center
        // Add label to view.
        view.addSubview(label)
        
        
        

        
        
        headerView2 = HeaderView()
        headerView2.layer.shadowOffset = CGSize(width: 0.0, height: 9.0)
        headerView2.layer.shadowOpacity = 0.25
        headerView2.layer.masksToBounds = false

        view.addSubview(headerView2)
        headerView2.snp.makeConstraints { make in
            make.leading.trailing.top.equalTo(view)
            make.height.equalTo(120)
        }
        collectionView.snp.makeConstraints {make in
            make.top.equalTo(headerView2.snp.bottom).offset(12)
            make.centerX.width.bottom.equalToSuperview()
        }

        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        collectionView? = UICollectionView(frame: .zero, collectionViewLayout: layout)
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        collectionView?.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.98, alpha: 1.0)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.refreshControl = refreshControl
        
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0.0)
        navigationItem.title = "Project Teams"
        let font = UIFont(name: "Helvetica", size: 22)!
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0),
             NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 36)!]
        
        navigationController!.navigationBar.barTintColor = UIColor(red:0.33, green:0.01, blue:0.95, alpha:1.0)
        

        
        collectionView?.register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: teamCell)
        
        
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        self.view.addSubview(scrollView)
        //Header collectionView
        let layoutB = UICollectionViewFlowLayout()
        layoutB.scrollDirection = .horizontal
        let collectionViewB = UICollectionView(frame: .zero, collectionViewLayout: layoutB)
        //let filterLayoutB = UICollectionViewFlowLayout()
        //collectionViewB.backgroundColor = UIColor(hue: 0.0722, saturation: 0, brightness: 0.93, alpha: 1.0)
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        
        scrollView.delegate = self
        scrollView.addSubview(collectionViewB)
        //collectionViewB.register(HeaderView.self, forCellWithReuseIdentifier: headerView)     // SIGBART
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        collectionViewB.canCancelContentTouches = true;
        
        self.view.addSubview(collectionView)
        self.view.addSubview(collectionViewB)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCell, for: indexPath) as! TeamsCollectionViewCell
        cell.team = teams[indexPath.item]
        
        // Handle Tap
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(sender:)))
        tap.numberOfTapsRequired = 1
        cell.addGestureRecognizer(tap)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 64, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath)
        headerView.setNeedsUpdateConstraints()
        
//        //
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: teamCell, for: indexPath) as! TeamsCollectionViewCell
//        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCellSelected(sender:))))
//        //return cell
        
        
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 75)
    }
    
    @objc func pulledToRefresh() {
        // Place some code here that fetches new data
        // Then call refreshControl.endRefreshing() once we get that data back
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.refreshControl.endRefreshing()
        }
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let appDevViewController = ProjectTeamViewController()
        navigationController?.pushViewController(appDevViewController, animated: true)
    }
    
//    @objc func handleCellSelected(sender: UITapGestureRecognizer){
//        let cell = sender.view as! TeamsCollectionViewCell
//        let indexPath = collectionView?.indexPath(for: cell)
//    }

}
