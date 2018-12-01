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

enum SearchType {
    case summary
    case team
    case accomplishments
    case members
    case socialMedias
    case timeline
}

class NetworkManager {
    
    private static let URL = "35.185.52.186/api/"
    var teamname = ""
    
    static func getSummary(fromProjectTeams summary: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        let parameters: [String:Any] = [
            "description": summary
        ]
        Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getImage(fromProjectTeams imageURL: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
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
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTeam(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getAccomplishments(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getMembers(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
       Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getSocialMedias(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTimeline(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let decoder = JSONDecoder()
                if let projectTeamsSearchResponse = try? decoder.decode(ProjectTeamSearchResponse.self, from: data) {
                    print(projectTeamsSearchResponse.results)
                    didGetProjectTeams(projectTeamsSearchResponse.results)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
