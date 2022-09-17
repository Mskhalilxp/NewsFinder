//
//  Repository.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation

protocol Repository {
  
  associatedtype T
  
    func getAll(country:String,category:String,completion: @escaping ([T]) -> Void)
    func get(id: Int, completionHandler: (T?, Error?) -> Void)
    func list(completionHandler: ([T]?, Error?) -> Void)
    func add(_ item: T, completionHandler: (Error?) -> Void)
    func delete(_ item: T, completionHandler: (Error?) -> Void)
    func edit(_ item: T, completionHandler: (Error?) -> Void)
  
}
