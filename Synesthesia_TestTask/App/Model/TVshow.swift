//
//  TVshow.swift
//  Synesthesia_TestTask
//
//  Created by Alexander Grigoryev on 3.11.2022.
//

import Foundation

// MARK: - StartElement
struct StartElement: Codable, Hashable, Equatable {
    let score: Double
    let show: Show
    
    static func == (lhs: StartElement, rhs: StartElement) -> Bool {
        lhs.score == rhs.score
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(score)
    }
}

// MARK: - Show
struct Show: Codable {
    let id: Int
    let url: String
    let name: String
    let genres: [String]
    let runtime, averageRuntime: Int?
    let premiered, ended: String?
    let officialSite: String?
    let schedule: Schedule
    let rating: Rating
    let weight: Int
    let network, webChannel: Network?
    let externals: Externals
    let image: ShowsImage
    let summary: String?
    let updated: Int
    let links: Links
    
    enum CodingKeys: String, CodingKey {
        case id, url, name, genres, runtime, averageRuntime, premiered, ended, officialSite, schedule, rating, weight, network, webChannel, externals, image, summary, updated
        case links = "_links"
    }
}

// MARK: - Externals
struct Externals: Codable {
    let tvrage, thetvdb: Int?
    let imdb: String?
}

// MARK: - Image
struct ShowsImage: Codable {
    let medium, original: String
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: Nextepisode
    let previousepisode, nextepisode: Nextepisode?
    
    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case previousepisode, nextepisode
    }
}

// MARK: - Nextepisode
struct Nextepisode: Codable {
    let href: String
}

// MARK: - Network
struct Network: Codable {
    let id: Int
    let name: String
    let country: Country?
    let officialSite: String?
}

// MARK: - Country
struct Country: Codable {
    let name, code, timezone: String
}

// MARK: - Rating
struct Rating: Codable {
    let average: Double?
}

// MARK: - Schedule
struct Schedule: Codable {
    let time: String
    let days: [String]
}


typealias StartSearch = [StartElement]

