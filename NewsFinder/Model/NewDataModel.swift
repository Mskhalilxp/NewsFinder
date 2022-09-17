//
//  NewDataModel.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation

// MARK: - Mm
struct NewDataModel: Codable {
    let status: String
    let totalResults: Int
    let results: [Result]
    let nextPage: Int
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let link: String
    let keywords, creator: [String]?
    let videoURL: String?
    let content: String?
    let pubDate: String
    let imageURL: String?
    let sourceID: String
    let country, category: [String]
    let language: String

    enum CodingKeys: String, CodingKey {
        case title, link, keywords, creator
        case videoURL = "video_url"
 
        case content, pubDate
        case imageURL = "image_url"
        case sourceID = "source_id"
        case country, category, language
    }
}
