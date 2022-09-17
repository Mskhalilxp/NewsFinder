//
//  NewsRepository.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation

class NewsApiRepository:Repository {
    
    typealias T = NewCellViewModel
    private let sessionProvider = URLSessionProvider()
    
    func getAll(country:String,category:String,completion: @escaping ([NewCellViewModel]) -> Void) {
        
        sessionProvider.request(type: NewsApiModel.self, service: PostService.NewsApi) { [weak self] response in
            DispatchQueue.main.async {
                guard let self = self else { return }
                //self.isLoading.value = false
                switch response {
                case let .success(items):
                    var news = [NewCellViewModel]()
                    news = items.articles
                        .map({NewCellViewModel(id: "", imageUrl: $0.urlToImage, title: $0.title, author: $0.author, link: $0.url
                                               , date: $0.publishedAt)})
                    completion(news)
                    
                case let .failure(error):
                    print(error)
                    completion([])
                    
                }
            }
        }
        
    }
    
    
    func get(id: Int, completionHandler: (NewCellViewModel?, Error?) -> Void) {}
    
    func list(completionHandler: ([NewCellViewModel]?, Error?) -> Void) {}
    
    func add(_ item: NewCellViewModel, completionHandler: (Error?) -> Void) {}
    
    func delete(_ item: NewCellViewModel, completionHandler: (Error?) -> Void) {}
    
    func edit(_ item: NewCellViewModel, completionHandler: (Error?) -> Void) {}
    
    
    
    
}
