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
    
    var vc2 = NewProjectTeamViewController()
    let teams = [Team(image: "appdev", name: "Cornell AppDev", type: "type"),
                 Team(image: "aguaclara", name: "AguaClara", type: "type"),
                 Team(image: "bigredbridges", name: "Big Red Bridges", type: "type"),
                 Team(image: "acmprogramming", name: "Cornell ACM Programming", type: "type"),
                 Team(image: "bajasae", name: "Cornell Baja SAE", type: "type"),
                 Team(image: "chemecar", name: "Cornell ChemE Car", type: "type"),
                 Team(image: "concretecanoe", name: "Cornell Concrete Canoe", type: "type"),
                 Team(image: "cuprobotics", name: "Cornell Cup Robotics", type: "type"),
                 Team(image: "datascience", name: "Cornell Data Science", type: "type"),
                 Team(image: "designtech", name: "Cornell Design & Tech Initiative", type: "type"),
                 Team(image: "engineeringworldhealth", name: "Cornell Engineering World Health", type: "type"),
                 Team(image: "igem", name: "Cornell iGEM", type: "type"),
                 Team(image: "hyperloop", name: "Cornell Hyperloop", type: "type"),
                 Team(image: "marsrover", name: "Cornell Mars Rover", type: "type"),
                 Team(image: "microg", name: "Cornell Micro-g", type: "type"),
                 Team(image: "racing", name: "Cornell Racing", type: "type"),
                 Team(image: "rocketry", name: "Cornell Rocketry Team", type: "type"),
                 Team(image: "seismicdesign", name: "Cornell Seismic Design", type: "type"),
                 Team(image: "cuauv", name: "CUAUV", type: "type"),
                 Team(image: "debut", name: "Cornell University DEBUT", type: "type"),
                 Team(image: "cuair", name: "CUAir", type: "type"),
                 Team(image: "autonomousbike", name: "CU Autonomous Bicycle", type: "type"),
                 Team(image: "sail", name: "CU Sail", type: "type"),
                 Team(image: "solarboat", name: "CU Solar Boat", type: "type"),
                 Team(image: "designbuildfly", name: "Design Build Fly", type: "type"),
                 Team(image: "sustainableworld", name: "Engineers for a Sustainable World", type: "type"),
                 Team(image: "withoutborders", name: "Engineers Without Borders", type: "type"),
                 Team(image: "resistanceracing", name: "Resistance Racing", type: "type"),
                 Team(image: "steelbridge", name: "Steel Bridge", type: "type")]
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .cyan
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        print("aaaaaaaa")
//        NetworkManager.getSocialMedias(fromProjectTeams: ["cuair"], { recipes in
//            print("aaaaaaaa")
//            print(recipes)
//            print("rfnberbnuvibenrv;nare")
////        guard let jsonArray = recipes as? [[String: Any]] else {
////            return
////        }
////        print("jsonArray")
////        print(jsonArray)
//        })
//        
//        NetworkManager.getAccomplishments(fromProjectTeams: ["cuair"], { recipes in
//            print("zzzzzzzzzz")
//            print(recipes)
//            let routes = recipes.description as? String
//            print(routes)
////                recipes.value(forKey: "description") as? NSArray
//            print("lololololol.lol.")
//        })
        
        
        
        
        
        // larger header
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
        UINavigationBar.appearance().largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white
        
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
//        refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        collectionView?.backgroundColor = UIColor(hue: 0, saturation: 0, brightness: 0.98, alpha: 1.0)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.refreshControl = refreshControl
        
        self.navigationController!.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 0.0)
        navigationItem.title = "Project Teams"
        navigationController?.navigationBar.barStyle = .black   // makes it WHITE
        
//        UIBarButtonItem.appearance().setTitlePositionAdjustment(UIOffset(horizontal: 100.0, vertical: 0.0), for: UIBarMetrics)
        
        
        //        let font = UIFont(name: "Helvetica", size: 22)!
        self.navigationController?.navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1.0),
             NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 32.0)]
        
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
//        if teams[indexPath.item].name ==  "appdev" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap1(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "aguaclara" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap2(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "bigredbridges" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap3(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "acmprogramming" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap4(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "bajasae" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap5(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "chemecar" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap6(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "concretecanoe" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap7(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "cuprobotics" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap8(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "datascience" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap9(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "designtech" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap10(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "engineeringworldhealth" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap11(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "igem" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap12(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "hyperloop" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap13(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "marsrover" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap14(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "microg" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap15(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "racing" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap16(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "rocketry" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap17(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "seismicdesign" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap18(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "cuauv" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap19(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "debut" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap20(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "cuair" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap21(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "autonomousbike" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap22(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "sail" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap23(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "solarboat" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap24(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "designbuildfly" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap25(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "sustainableworld" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap26(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "withoutborders" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap27(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "resistanceracing" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap28(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
//        if teams[indexPath.item].name ==  "steelbridge" {
//            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap29(sender:)))
//            tap.numberOfTapsRequired = 1
//            cell.addGestureRecognizer(tap)
//            return cell
//        }
        
        
        // give up
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
        let appDevViewController = NewProjectTeamViewController()
        navigationController?.pushViewController(appDevViewController, animated: true)

    }
    
    @objc func handleTap1(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController1()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap2(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController2()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap3(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController3()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap4(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController4()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap5(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController5()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap6(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController6()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap7(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController7()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap8(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController8()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap9(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController9()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap10(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController10()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap11(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController11()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap12(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController12()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap13(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController13()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap14(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController14()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap15(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController15()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap16(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController16()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap17(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController17()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap18(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController18()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap19(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController19()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap20(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController20()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap21(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController21()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap22(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController22()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap23(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController23()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap24(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController24()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap25(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController25()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap26(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController26()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap27(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController27()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap28(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController28()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    @objc func handleTap29(sender: UITapGestureRecognizer) {
        let appDevViewController = NewProjectTeamViewController29()
        navigationController?.pushViewController(appDevViewController, animated: true)
        
    }
    
    
}
