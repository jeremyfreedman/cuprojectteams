//
//  NetworkManager.swift
//  ProjectTeams
//
//  Copyright © 2018 CS 1998. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum SearchType {
    case summary
    case team
    case accomplishments
    case members
    case socialMedias
}

class NetworkManager {
    
    private static let URL = ""
    var teamname = ""
    
    static func getSummary(fromProjectTeams teamname: [String], _ didGetProjectTeams: @escaping ([ProjectTeam]) -> Void) {
        // TODO: Fill in this function. This function should make a network request
        // to the Recipe Puppy API given an array of ingredients and then call the
        // didGetRecipes closure after you receive a response and decode it.
//        let summaryString = getSummary
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .post, /*parameters: Parameters,*/ encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
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
        // TODO: Fill in this function. This function should make a network request
        // to the Recipe Puppy API given an array of ingredients and then call the
        // didGetRecipes closure after you receive a response and decode it.
//        let teamString = getTeam
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .post, /*parameters: Parameters,*/ encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
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
        // TODO: Fill in this function. This function should make a network request
        // to the Recipe Puppy API given an array of ingredients and then call the
        // didGetRecipes closure after you receive a response and decode it.
//        let accomplishmentsString = getAccomplishments
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .post, /*parameters: Parameters,*/ encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
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
        // TODO: Fill in this function. This function should make a network request
        // to the Recipe Puppy API given an array of ingredients and then call the
        // didGetRecipes closure after you receive a response and decode it.
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .post, /*parameters: Parameters,*/ encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
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
        // TODO: Fill in this function. This function should make a network request
        // to the Recipe Puppy API given an array of ingredients and then call the
        // didGetRecipes closure after you receive a response and decode it.
        let parameters: [String:Any] = [
            "teamname": teamname
        ]
        Alamofire.request(URL, method: .post, /*parameters: Parameters,*/ encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
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
