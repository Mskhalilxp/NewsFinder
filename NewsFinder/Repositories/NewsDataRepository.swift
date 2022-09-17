//
//  NewsDataRepository.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation

class NewsDataRepository:Repository {
    
    typealias T = NewCellViewModel
    private let sessionProvider = URLSessionProvider()
    
    func getAll(country:String,category:String,completion: @escaping ([NewCellViewModel]) -> Void) {
        URLCache.shared.removeAllCachedResponses()
        sessionProvider.request(type: NewDataModel.self, service: PostService.NewsData(country: country, category: category)) { [weak self] response in
            DispatchQueue.main.async {
                guard let self = self else { return }
                //self.isLoading.value = false
                switch response {
                case let .success(items):
                    var news = [NewCellViewModel]()
                    news = items.results.map({NewCellViewModel(id: $0.sourceID, imageUrl: $0.imageURL, title: $0.title, author: $0.creator?.first ?? "", link: $0.link, date: $0.pubDate)})
                    completion(news)
                    
                case let .failure(error):
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
