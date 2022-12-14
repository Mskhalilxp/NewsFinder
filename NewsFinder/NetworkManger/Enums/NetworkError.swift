//
//  NetworkError.swift
//  RoyaTvApp
//
//  Created by Roya TV on 4/29/21.
//

import Foundation

enum NetworkError {
    case unknown
    case noJSONData
    case JSONParsingError
    case parseUrlFail
    case notFound
    case validationError
    case serverError
    case unauthorized
 
    
    var errorDescription: String? {
        switch self {
        case .noJSONData:
            return "No Json Data."
        case .JSONParsingError:
            return "json parsing error"
        case .parseUrlFail:
            return "Cannot initial URL object."
        case .notFound:
            return "Not Found"
        case .validationError:
            return "Validation Errors"
        case .serverError:
            return "Internal Server Error"
        case .unauthorized:
            return "User is not authorized"
        case .unknown:
            return "Something went wrong."
            
            
        }
    }
}
