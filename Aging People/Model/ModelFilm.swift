//
//  File.swift
//  Aging People
//
//  Created by 라완 💕 on 14/05/1444 AH.
//

import Foundation

// MARK: - Film
struct Film: Codable {
    let count: Int?
    let next: String?
    let results: [Resultt]?
}

// MARK: - Result
struct Resultt: Codable {
    let title: String?
    let episodeID: Int?
    let openingCrawl, director, producer, releaseDate: String?
    let characters, planets, starships, vehicles: [String]?
    let species: [String]?
    let created, edited: String?
    let url: String?


    enum CodingKeys: String, CodingKey {
        case title
        case episodeID = "episode_id"
        case openingCrawl = "opening_crawl"
        case director, producer
        case releaseDate = "release_date"
        case characters, planets, starships, vehicles, species, created, edited, url
    }
}
