//
//  ProjectTeam.swift
//  ProjectTeams
//
//  Copyright © 2018 CS 1998. All rights reserved.
//

import UIKit

// DELETE THIS LATER
struct ProjectTeam: Codable {
    let summary: String
    let team: String
    let accomplishments: String
    let members: String
    let socialMedias: String
    let timeline: String
}

// All Teams
struct AllTeams: Codable {
    let success: Bool
    let team: [EngineeringTeam]
}
// Individual Team
struct EngineeringTeam: Codable {
    let name: String
    let imageURL: String
    let description: String
    let category: String
}

// Events/Timeline
struct Events: Codable {
    let success: Bool
    let data: [Timeline]
}
struct Timeline: Codable {
    let __placeholder__: String // FINISH THIS
}

// Accomplishments
struct Accomplishments: Codable {
    let success: Bool
    let data: [Accomplished]
}

struct Accomplished: Codable {
    let name: String
    let year: String
    let description: String
    let img_url: String
}

// Team Members
struct Members: Codable {
    let success: Bool
    let data: [TeamMember]
}
struct TeamMember: Codable {
    let name: String
    let comment: String
    let datetime: String
    let img_url: String
}



// Social Medias
struct SocialMedia: Codable {
    let success: Bool
    let data: [SocialsDict]
}
struct SocialsDict: Codable {
    let facebook: String
    let twitter: String
    let instagram: String
    let website: String
    let git: String
    let email: String
}

struct ProjectTeamSearchResponse: Codable {
    var results: [ProjectTeam]
}

struct AllTeamsSearchResponse: Codable {
    var results: [AllTeams]
}

struct EngineeringTeamSearchResponse: Codable {
    var results: [EngineeringTeam]
}

struct EventsSearchResponse: Codable {
    var results: [Events]
}

struct AccomplishmentsSearchResponse: Codable {
    var results: [Accomplishments]
}


struct AccomplishedSearchResponse: Codable {
    var results: [Accomplished]
}


struct TimelineSearchResponse: Codable {
    var results: [Timeline]
}

struct MembersSearchResponse: Codable {
    var results: [Members]
}

struct TeamMemberSearchResponse: Codable {
    var results: [TeamMember]
}

struct SocialMediasSearchResponse: Codable {
    var results: [SocialMedia]
}
