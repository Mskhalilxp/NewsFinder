//
//  NewsModel.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation

struct NewCellViewModel {
    var id : String
    var imageUrl : String?
    var title : String
    var author : String
    var link : String
    var date : String
    
    func getNewDataFormat()->String?{
        let dateFormatter = DateFormatter()
        if let myDate = dateFormatter.dateFromMultipleFormats(fromString: date) {
            print("success!")
            return myDate
        }
        return nil
    }
}
