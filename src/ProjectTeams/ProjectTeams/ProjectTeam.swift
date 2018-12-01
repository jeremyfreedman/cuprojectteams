//
//  ProjectTeam.swift
//  ProjectTeams
//
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

struct ProjectTeam: Codable {
    let summary: String
    let team: String
    let accomplishments: String
    let members: String
    let socialMedias: String
    let timeline: String
}

struct ProjectTeamSearchResponse: Codable {
    var results: [ProjectTeam]
}
