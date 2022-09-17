//
//  ProviderProtocol.swift
//  NetworkLayer
//
//  Created by Roya TV on 4/29/21.
//

protocol ProviderProtocol {
    func request<T>(type: T.Type, service: ServiceProtocol, completion: @escaping (NetworkResponse<T>) -> ()) where T: Decodable
}
