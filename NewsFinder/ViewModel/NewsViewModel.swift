//
//  NewsViewModel.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import UIKit

class NewsViewModel {
    
    var dataSource = Observable<[NewCellViewModel]>([])
    private let sessionProvider = URLSessionProvider()
    
    
    let newsRepository = NewsApiRepository()
    let newsDataRepository = NewsDataRepository()
    
    var category = ""
    var country = ""
    var isFilterOn = false
    
    init(data : Observable<[NewCellViewModel]>) {
        self.dataSource = data
    }
    
    func clearFilter(){
        isFilterOn = false
        self.category = ""
        self.country = ""
    }
    
    func fetchData(){
        
        let group = DispatchGroup()
        var temp = [NewCellViewModel]()
        
        if !isFilterOn {
            group.enter()
            newsRepository.getAll(country: self.country, category: self.category, completion: { newsArray in
                group.leave()
                temp.append(contentsOf: newsArray)
            })
        }
        
        group.enter()
        newsDataRepository.getAll(country: self.country, category: self.category, completion: { newsArray in
            group.leave()
            temp.append(contentsOf: newsArray)
        })
        
        
        group.notify(queue: .main) {
            self.dataSource.value = temp
        }
    }
}


