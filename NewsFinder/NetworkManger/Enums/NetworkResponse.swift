//
//  NetworkResponse.swift
//  NetworkLayer
//
//  Created by Roya TV on 4/29/21.
//

enum NetworkResponse<T> {
    case success(T)
    case failure(NetworkError)
}
