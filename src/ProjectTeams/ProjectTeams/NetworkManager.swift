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
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let engineeringTeamSearchResponse = try? decoder.decode(EngineeringTeamSearchResponse.self, from: data) {
                    print(engineeringTeamSearchResponse.results)
                    didGetProjectTeams(engineeringTeamSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getImage(fromProjectTeams imageURL: [String], _ didGetProjectTeams: @escaping ([EngineeringTeam]) -> Void) {
        let parameters: [String:Any] = [
            "img_url": imageURL
        ]
        Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let engineeringTeamSearchResponse = try? decoder.decode(EngineeringTeamSearchResponse.self, from: data) {
                    print(engineeringTeamSearchResponse)
                    didGetProjectTeams(engineeringTeamSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    static func getTeam(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
//        let parameters: [String:Any] = [
//            "teamname": teamname
//        ]
//        Alamofire.request(URL, method: .get).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                let decoder = JSONDecoder()
//                if let projectTeamsSearchResponse = try? decoder.decode(
//                    ProjectTeamSearchResponse.self, from: data) {
//                    print(projectTeamsSearchResponse.results)
//                    didGetProjectTeams(projectTeamsSearchResponse.results)
//                } else {
//                    print("Invalid Response Data")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    static func getAccomplishments(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Accomplishments]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        var accomplishmentsURL = URL+self.teamname+"/accomplishments/"
        Alamofire.request(accomplishmentsURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let accomplishmentsSearchResponse = try? decoder.decode(AccomplishmentsSearchResponse.self, from: data) {
                    print(accomplishmentsSearchResponse.results)
                    didGetProjectTeams(accomplishmentsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
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
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let membersSearchResponse = try? decoder.decode(MembersSearchResponse.self, from: data) {
                    print(membersSearchResponse.results)
                    didGetProjectTeams(membersSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getSocialMedias(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([SocialMedia]) -> Void) {
        let parameters: [String:Any] = [
            "instagram": "instagram"
        ]
        let timelineURL = URL+self.teamname+"/socials/"
        Alamofire.request(timelineURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
//        Alamofire.request(timelineURL, method: .get, parameters: parameters).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
 
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                    print("social media SUCCESS")
                }
                let decoder = JSONDecoder()
                
                
                
                // NOT EXECUTED:
                if let socialMediasSearchResponse = try? decoder.decode(SocialMediasSearchResponse.self, from: data) {
                    print(socialMediasSearchResponse.results)
                    didGetProjectTeams(socialMediasSearchResponse.results)
                    print("social media DECODE")
                    
                    
                    
                } else {
                    print("ELSE (DOD NOT DECODE):")
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print("social media FAILURE")
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTimeline(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([Events]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        var timelineURL = URL+self.teamname+"/timeline/"
        Alamofire.request(timelineURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let eventsSearchResponse = try? decoder.decode(EventsSearchResponse.self, from: data) {
                    print(eventsSearchResponse.results)
                    didGetProjectTeams(eventsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
