//
//  Task.swift
//  NetworkLayer
//
//  Created by Roya TV on 4/29/21.
//

typealias Parameters = [String: Any]

enum Task {
    case requestPlain
    case requestParameters(Parameters)
    case uploadMultipart
}
