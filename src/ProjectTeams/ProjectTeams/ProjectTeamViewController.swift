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
    
    let projectTeam = "appdev"
    
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
        navigationController?.navigationBar.tintColor = .white
//        let navBackgroundImage:UIImage! = UIImage(named: "appdev")
//        self.navigationController?.navigationBar.setBackgroundImage(navBackgroundImage,
//                                                                    for: .default)
        
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
    
    
    
//    // get info from database
//    func updateSearchResults(/*for searchController: UISearchController*/) {
//            if !projectTeam.isEmpty {
//                switch searchBy {
//                    /// ***
//                    /// NOTE: You can set searchBy to be .title or .ingredients at the top of this class
//                /// ***
//                case .summary:
//                    // TODO: Make a request to the Recipe Puppy API using a
//                    // title and then update the table view with the updated [Recipe]
//                    // that you get after you decode the response
//                    // Hint: The searchText is the title.
//                    NetworkManager.getRecipe(fromTitle: searchText, { (recipes) in
//                        self.recipes = recipes
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
//                    })
//
//                case .ingredients:
//                    // TODO: Make a request to the Recipe Puppy API using a list of
//                    // ingredients and then update the table view with the updated [Recipe]
//                    // that you get after you decode the response
//                    // Hint: The searchText is a string where the ingredients are
//                    // separated by commas. (i.e. Apple, Butter, Cream)
//                    let searchTextArray = searchText.components(separatedBy: ",")
//                    NetworkManager.getRecipe(fromIngredients: searchTextArray, { (recipes) in
//                        self.recipes = recipes
//                        DispatchQueue.main.async {
//                            self.tableView.reloadData()
//                        }
//                    })
//                }
//            }
//            else {
//                self.recipes = []
//                self.tableView.reloadData()
//            }
//    }
    
    
}
