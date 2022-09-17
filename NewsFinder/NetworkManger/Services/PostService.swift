//
//  PostService.swift
//  NetworkLayer
//
//  Created by Roya TV on 4/29/21.
//

import Foundation

enum PostService: ServiceProtocol {
    
    case NewsApi
    case NewsData(country:String?,category:String?)
    
    var baseURL: URL {
        switch self{
        case .NewsApi:
            return URL(string: "https://newsapi.org/")!
        case .NewsData:
            return URL(string: "https://newsdata.io/")!
            
        default:
            return URL(string: "")!
        }
        
    }
    
    var path: String {
        switch self {
        case .NewsApi:
            return "v2/everything"
            
        case .NewsData:
            return "api/1/news"
            
        default:
            return ""
            
        }
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        switch self {
            
        case .NewsApi:
            return .requestParameters(["q" :"apple" ,"apiKey" : AppConfiguration().newsApiKey ])
            
            
        case .NewsData(let country,let category):
            var dataArray = ["apiKey" : AppConfiguration().newsDataApiKey  ]
            if let country = country , country != "" {
                dataArray["country"] = country
            }
            if let category = category , category != ""  {
                dataArray["category"] = category
            }
            return .requestParameters(dataArray)
            
        default:
            return .requestPlain
            
        }
    }
    
    var headers: Headers? {
        return ["Content-type": "application/x-www-form-urlencoded" ]
        
    }
    
    var parametersEncoding: ParametersEncoding {
        return .url
    }
}
