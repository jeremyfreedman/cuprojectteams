//
//  NetworkManager.swift
//  ProjectTeams
//
//  Copyright © 2018 CS 1998. All rights reserved.
//
// google cloud ip: 35.185.52.186

import Foundation
import Alamofire
import SwiftyJSON

//enum SearchType {
//    case summary
//    case team
//    case accomplishments
//    case members
//    case socialMedias
//    case timeline
//}

class NetworkManager {
    
    private static let URL = "http://35.185.52.186/api/team/"
    private static var teamname = "CU%20Air"
    
    static func getSummary(fromProjectTeams summary: [String], _ didGetProjectTeams: @escaping ([EngineeringTeam]) -> Void) {
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
                        print(unwrappedDESC)
                    }
                    
                }
                    break
                    case .failure(_):
                    NSAssertionHandler()
                    break
            }
        }
    }
    
    static func getImage(fromProjectTeams imageURL: [String], _ didGetProjectTeams: @escaping ([EngineeringTeam]) -> Void) {
        let parameters: [String:Any] = [
            "img_url": imageURL
        ]
        var imageURL = URL+teamname+"/"
        Alamofire.request(imageURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let data = response.result.value{
                    let json = JSON(data)
                    let desc = json["data"]["img_url"].string
                    if let unwrappedDESC = desc {
                        print(unwrappedDESC)
                    }
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    static func getAccomplishments(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Accomplishments]) -> Void) {
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
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    static func getMembers(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Members]) -> Void) {
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
                    
                    print(memberArray)
                    //didGetProjectTeams(socialMediaArray)
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    static func getSocialMedias(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([SocialMedia]) -> Void) {
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
                    print(socialMediaArray)
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
    
    static func getTimeline(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Events]) -> Void) {
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
                    print(timelineArray)
                    //didGetProjectTeams(socialMediaArray)
                }
                break
            case .failure(_):
                NSAssertionHandler()
                break
            }
        }
    }
}
