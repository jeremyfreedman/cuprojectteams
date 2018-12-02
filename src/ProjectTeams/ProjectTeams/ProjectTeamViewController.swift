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
    let projectTeamIdentifier = "ProjectTeam"
    var projectTeams: [ProjectTeam] = []   // fix this !!!
    var socialMedias: [SocialMedia] = []
    
    
    private let myArray: NSArray =
        ["SUMMARY\n\ntext text text\ntext text text\ntext text text","ACCOMPLISHMENTS\n\ntext text text\ntext text text\ntext text text","MEMBERS\n\ntext text text\ntext text text\ntext text text","TIMELINE\n\ntext text text\ntext text text\ntext text text","SOCIAL MEDIAS\n\ntext text text\ntext text text\ntext text text"]
//    var arrImageName: [String] = ["appdev", "", "", ""]
    private var myTableView: UITableView!
    var headerImage = #imageLiteral(resourceName: "appdev")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        //myTableView.register(TeamInfoTableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        //myTableView.register(UITableViewCell.self, forCellReuseIdentifier: projectTeamIdentifier)
        myTableView.rowHeight = UITableView.automaticDimension
        self.myTableView.rowHeight = 500
        
        
        myTableView.tableFooterView = UIView()  // get rid of empty cells
        myTableView.register(TeamInfoTableViewCell.self, forCellReuseIdentifier: projectTeamIdentifier)
        self.view.addSubview(myTableView)
        definesPresentationContext = true
        
        
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

        print("update")
        updateSearchResults()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return myArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//        cell.textLabel!.text = "\(myArray[indexPath.row])"
////        cell.imageView?.image = UIImage(named:self.arrImageName[indexPath.row])
//        cell.textLabel?.numberOfLines = 0;  // allow multiple lines of text
//
//        return cell
//    }
    
    
    
    
    
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: projectTeamIdentifier, for: indexPath)  as! TeamInfoTableViewCell
        
        cell.textLabel?.numberOfLines = 0;  // allow multiple lines of text
//        cell.summaryLabel.text = socialMedias[indexPath.row].success?.description ?? "none"
        cell.summaryLabel.text = socialMedias[indexPath.row].data[0].facebook
//        cell.summaryLabel.text = projectTeams[indexPath.row].summary
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projectTeams.count
    }
    
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }


    
    // MARK: UISearchResultsUpdating Protocol
    
    func updateSearchResults() {
        print("trying cuair")
                    NetworkManager.getSocialMedias(fromProjectTeams: ["cuair"], { teams in
                        self.socialMedias = teams
                        ("print getting cuair...")
//                        projectTeams[indexPath.row].socialMedias
                        DispatchQueue.main.async {
                            self.myTableView.reloadData()
                            print("request successful")
                        }
                    })
                // else:
                //self.projectTeams = []
                //self.myTableView.reloadData()
        
//        NetworkManager.getSummary(fromProjectTeams: ["cuair"], { teams in
//            self.projectTeams = teams
//            DispatchQueue.main.async {
//                self.myTableView.reloadData()
//                print("request successful")
//            }
//        })
            print("cuair done")
        }
    }
