//
//  ViewController.swift
//  jdb393_p2
//
//  Created by Jacob Bee Ho Brown on 10/4/18.
//  Copyright © 2018 Jacob Bee Ho Brown. All rights reserved.
//
// Things that could be better:
// - Have a yes/no option for duplicateAlert -- do you want to update the quantity? -- y/n
// - trim whitespace on user inputs
// - displayList.bottomAnchor -- move delete item so it won't be in the way?
//  - change whole layout design
// - add newest item to the end of the display (on-screen) list
// fix nil and "" in if-statements


import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class NewProjectTeamViewController25: UIViewController {
    
    var decription: UILabel!
    var members: UILabel!
    var accomplishments: UILabel!
    var timeline: UILabel!
    var socialMedias: UILabel!
    var temp = 0
    
    
    private let URL = "http://35.185.52.186/api/team/"
    private var teamname = "CU%20Air"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        decription = UILabel()
        decription.translatesAutoresizingMaskIntoConstraints = false
        decription.text = ""
        decription.textAlignment = .center
        decription.font = .systemFont(ofSize: 16, weight: .bold)
        decription.textColor = .black
        decription.lineBreakMode = NSLineBreakMode.byWordWrapping
        decription.numberOfLines = 0
        updateSearchResults()
        view.addSubview(decription)
        
        accomplishments = UILabel()
        accomplishments.translatesAutoresizingMaskIntoConstraints = false
        accomplishments.text = ""
        accomplishments.textAlignment = .center
        accomplishments.font = .systemFont(ofSize: 16, weight: .bold)
        accomplishments.textColor = .black
        accomplishments.lineBreakMode = NSLineBreakMode.byWordWrapping
        accomplishments.numberOfLines = 0
        updateSearchResults()
        view.addSubview(accomplishments)
        
        timeline = UILabel()
        timeline.translatesAutoresizingMaskIntoConstraints = false
        timeline.text = ""
        timeline.textAlignment = .center
        timeline.font = .systemFont(ofSize: 16, weight: .bold)
        timeline.textColor = .black
        timeline.lineBreakMode = NSLineBreakMode.byWordWrapping
        timeline.numberOfLines = 0
        updateSearchResults()
        view.addSubview(timeline)
        
        socialMedias = UILabel()
        socialMedias.translatesAutoresizingMaskIntoConstraints = false
        socialMedias.text = ""
        socialMedias.textAlignment = .center
        socialMedias.font = .systemFont(ofSize: 16, weight: .bold)
        socialMedias.textColor = .black
        socialMedias.lineBreakMode = NSLineBreakMode.byWordWrapping
        socialMedias.numberOfLines = 0
        updateSearchResults()
        view.addSubview(socialMedias)
        
        members = UILabel()
        members.translatesAutoresizingMaskIntoConstraints = false
        members.text = ""
        members.textAlignment = .center
        members.font = .systemFont(ofSize: 16, weight: .bold)
        members.textColor = .black
        members.lineBreakMode = NSLineBreakMode.byWordWrapping
        members.numberOfLines = 0
        updateSearchResults()
        view.addSubview(members)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        // Use to NSLayoutConstraint.activate([]) to activate a list of constraints
        // Groceries
        NSLayoutConstraint.activate([
            // Makes imageView's centerX equal to the view's centerX
            decription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            decription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            decription.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            decription.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        // Grocery item:
        NSLayoutConstraint.activate([
            accomplishments.centerXAnchor.constraint(equalTo: decription.centerXAnchor),
            accomplishments.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            accomplishments.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            accomplishments.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        
        // Grocery item input
        NSLayoutConstraint.activate([
            timeline.centerXAnchor.constraint(equalTo: decription.centerXAnchor, constant: 80),
            timeline.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 445),
            timeline.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            timeline.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        
        // Quantity:
        NSLayoutConstraint.activate([
            socialMedias.centerXAnchor.constraint(equalTo: decription.centerXAnchor),
            socialMedias.topAnchor.constraint(equalTo: timeline.topAnchor, constant: 21),
            socialMedias.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            socialMedias.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 50)
            ])
        
        // Quantity input
        NSLayoutConstraint.activate([
            members.centerXAnchor.constraint(equalTo: decription.centerXAnchor, constant: 80),
            members.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 590),
            members.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -10),
            members.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        temp = temp + 100
        
    }
    
    
    
    func updateSearchResults() {
        self.getSummary(fromProjectTeams: ["cuair"], { sumM in
        print("print getting cuair...")
        DispatchQueue.main.async {
            self.viewDidLoad()
        print("request successful")
        }
        })
        
        self.getAccomplishments(fromProjectTeams: ["cuair"], { sumM in
            print("print getting cuair...")
            DispatchQueue.main.async {
                self.viewDidLoad()
                print("request successful")
            }
        })
        
        self.getTimeline(fromProjectTeams: ["cuair"], { sumM in
            print("print getting cuair...")
            DispatchQueue.main.async {
                self.viewDidLoad()
                print("request successful")
            }
        })
        
        self.getSocialMedias(fromProjectTeams: ["cuair"], { sumM in
            print("print getting cuair...")
            DispatchQueue.main.async {
                self.viewDidLoad()
                print("request successful")
            }
        })
        
        self.getMembers(fromProjectTeams: ["cuair"], { sumM in
            print("print getting cuair...")
            DispatchQueue.main.async {
                self.viewDidLoad()
                print("request successful")
            }
        })
        
        
    }
        
         func getSummary(fromProjectTeams summary: [String], _ didGetProjectTeams: @escaping ([EngineeringTeam]) -> Void) {
            let parameters: [String:Any] = [
                "description": summary
            ]
            var summaryURL = URL+teamname+"/"
            //        Alamofire.request(URL+"", method: .get).validate().responseData { (response) in
            Alamofire.request(summaryURL, method: .get).validate().responseData { (response) in
                switch response.result {
                case .success(let data):
                    if let data = response.result.value{
                        let json = JSON(data)
                        let desc = json["data"]["description"].string
                        if let unwrappedDESC = desc {
                            print("description")
                            print(unwrappedDESC)
                            self.changeSummaryLabel(social: unwrappedDESC)
                        }
                    
                    }
                    break
                case .failure(_):
                    NSAssertionHandler()
                    break
                }
            }
        }
    
    
     func changeSummaryLabel(social: String) {
        self.decription.text = social
        self.viewDidLoad()
    }
    
    
    
    
     func getAccomplishments(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Accomplishments]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        var accomplishmentsURL = URL+self.teamname+"/accomplishments/"
        Alamofire.request(accomplishmentsURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let data = response.result.value{
                    var tempArr = [String]()
                    var json = JSON(data)
                    var name = json["data"][0]["name"].string
                    //                    var year = "\(json["data"][0]["year"])".string
                    var year = json["data"][0]["year"].string
                    var description = json["data"][0]["description"].string
                    var img_url = json["data"][0]["description"].string
                    if let unwrappedNAME = name {
                        tempArr.append(unwrappedNAME)
                    }
                    if let unwrappedYEAR = year {
                        tempArr.append(unwrappedYEAR)
                    }
                    if let unwrappedDESC = description {
                        tempArr.append(unwrappedDESC)
                    }
                    if let unwrappedURL = img_url {
                        tempArr.append(unwrappedURL)
                    }
                    print("accomplishments")
                    print(tempArr)
                    self.changeAccomplishmentLabel(social: tempArr.joined(separator:","))
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    func changeAccomplishmentLabel(social: String) {
        self.accomplishments.text = social
        self.viewDidLoad()
    }
    
    
    
    
     func getTimeline(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Events]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        var timelineURL = URL+self.teamname+"/events/"
        Alamofire.request(timelineURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let data = response.result.value{
                    let json = JSON(data)
                    let a = json["data"][0]
                    let title = a["title"].string
                    let description = a["description"].string
                    var timelineArray = [String]()
                    if let unwrappedTITLE = title {
                        timelineArray.append(unwrappedTITLE)
                    }
                    if let unwrappedDESCRIPTION = description {
                        timelineArray.append(unwrappedDESCRIPTION)
                    }
                    print("timeline")
                    print(timelineArray)
                    self.changeTimeLineLabel(social: timelineArray.joined(separator:","))
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    func changeTimeLineLabel(social: String) {
        self.timeline.text = social
        self.viewDidLoad()
    }
    
    
    func getSocialMedias(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([SocialMedia]) -> Void) {
        let parameters: [String:Any] = [
            "instagram": "instagram"
        ]
        let timelineURL = URL+self.teamname+"/socials/"
        Alamofire.request(timelineURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let data = response.result.value{
                    let json = JSON(data)
                    let a = json["data"][0]
                    let facebook = a["facebook"].string
                    let twitter = a["twitter"].string
                    let instagram = a["instagram"].string
                    let website = a["website"].string
                    let git = a["git"].string
                    let email = a["email"].string
                    var socialMediaArray = [String]()
                    if let unwrappedFB = facebook {
                        socialMediaArray.append(unwrappedFB)
                    }
                    if let unwrappedTW = twitter {
                        socialMediaArray.append(unwrappedTW)
                    }
                    if let unwrappedIG = instagram {
                        socialMediaArray.append(unwrappedIG)
                    }
                    if let unwrappedWEB = website {
                        socialMediaArray.append(unwrappedWEB)
                    }
                    if let unwrappedGIT = git {
                        socialMediaArray.append(unwrappedGIT)
                    }
                    if let unwrappedMAIL = email {
                        socialMediaArray.append(unwrappedMAIL)
                    }
                    print("medias")
                    print(socialMediaArray)
                    self.changeSocialLabel(social: socialMediaArray.joined(separator:","))
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    func changeSocialLabel(social: String) {
        self.socialMedias.text = social
        self.viewDidLoad()
    }
    
    
    func getMembers(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Members]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL+self.teamname+"/members/", method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let data = response.result.value{
                    let json = JSON(data)
                    let a = json["data"][0]
                    let name = a["name"].string
                    let comment = a["description"].string
                    let datetime = a["datetime"].string
                    let img_url = a["img_url"].string
                    var timelineArray = [String]()
                    let b = json["data"][1]
                    let name2 = b["name"].string
                    let comment2 = b["description"].string
                    let datetime2 = b["datetime"].string
                    let img_url2 = b["img_url"].string
                    var memberArray = [String]()
                    if let unwrappedNAME = name {
                        memberArray.append(unwrappedNAME)
                    }
                    if let unwrappedCOMMENT = comment {
                        memberArray.append(unwrappedCOMMENT)
                    }
                    if let unwrappedDATETIME = datetime {
                        memberArray.append(unwrappedDATETIME)
                    }
                    if let unwrappedIMG = img_url {
                        memberArray.append(unwrappedIMG)
                    }
                    if let unwrappedNAME2 = name2 {
                        memberArray.append(unwrappedNAME2)
                    }
                    if let unwrappedCOMMENT2 = comment2 {
                        memberArray.append(unwrappedCOMMENT2)
                    }
                    if let unwrappedDATETIME2 = datetime2 {
                        memberArray.append(unwrappedDATETIME2)
                    }
                    if let unwrappedIMG2 = img_url2 {
                        memberArray.append(unwrappedIMG2)
                    }
                    print("members")
                    print(memberArray)
                    self.changeMemberLabel(social: memberArray.joined(separator:","))
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    func changeMemberLabel(social: String) {
        self.socialMedias.text = social
        self.viewDidLoad()
    }
    

    
}
