//
//  NewsApiModel.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation

// MARK: - Welcome
struct NewsApiModel: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable {
    let author, title, articleDescription: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String

    enum CodingKeys: String, CodingKey {
        case author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String
    let name: String
}

