//
//  AppDevViewController.swift
//  ProjectTeams
//
//  Created by Jacob Bee Ho Brown on 11/21/18.
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit
import SnapKit

class ProjectTeamViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    let headerView = "headerView"
//    var headerView2: TeamImageHeaderView!
    
    
    private let myArray: NSArray =
        ["Imformation about the project team\n\ntext text text\ntext text text\ntext text text","Imformation about acomplishments\n\ntext text text\ntext text text\ntext text text","Imformation about team members\n\ntext text text\ntext text text\ntext text text","Timeline info\n\ntext text text\ntext text text\ntext text text"]
//    var arrImageName: [String] = ["appdev", "", "", ""]
    private var myTableView: UITableView!
    var headerImage = #imageLiteral(resourceName: "appdev")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        
        self.myTableView.rowHeight = 500
        
        
        myTableView.tableFooterView = UIView()  // get rid of empty cells
        self.view.addSubview(myTableView)
        
        
        // larger header
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
//        let navBgImage:UIImage = UIImage(named: "appdev")!
//        self.navigationController!.navigationBar.setBackgroundImage(navBgImage, for: .default)
        

//        UINavigationBar.appearance().largeTitleTextAttributes =
//            [NSAttributedString.Key.foregroundColor: UIColor.green]
//        self.navigationController?.navigationBar.setBackgroundImage((cgImage: a), for: <#T##UIBarMetrics#>)
        
        
        
        
//        headerView2 = TeamImageHeaderView()
//        headerView2.layer.shadowOffset = CGSize(width: 0.0, height: 9.0)
//        headerView2.layer.shadowOpacity = 0.25
//        headerView2.layer.masksToBounds = false
//
//        view.addSubview(headerView2)
//        headerView2.snp.makeConstraints { make in
//            make.leading.trailing.top.equalTo(view)
//            make.height.equalTo(120)
//        }
//        myTableView.snp.makeConstraints {make in
//            make.top.equalTo(headerView2.snp.bottom).offset(12)
//            make.centerX.width.bottom.equalToSuperview()
//        }

        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
//        cell.imageView?.image = UIImage(named:self.arrImageName[indexPath.row])
        cell.textLabel?.numberOfLines = 0;  // allow multiple lines of text
        return cell
    }
    
//     func CollectionView(_ view: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let headerView = view.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath)
//        headerView.setNeedsUpdateConstraints()
//
//        //        //
//        //        let cell = view.dequeueReusableCell(withReuseIdentifier: teamCell, for: indexPath) as! TeamsviewCell
//        //        headerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleCellSelected(sender:))))
//        //        //return cell
//
//
//        return headerView
//    }
}
