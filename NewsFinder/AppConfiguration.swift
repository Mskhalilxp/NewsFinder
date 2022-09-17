//
//  AppConfiguration.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 17/09/2022.
//

import Foundation

final class AppConfiguration {
    lazy var newsApiKey: String = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "newsApiKey") as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        return apiKey
    }()
    
    lazy var newsDataApiKey: String = {
        guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "newsDataApiKey") as? String else {
            fatalError("ApiKey must not be empty in plist")
        }
        return apiKey
    }()
    
}
