//
//  FilterNewViewModel.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 17/09/2022.
//

import Foundation


class FilterNewViewModel {
    
    var countryArray = ["US","AE","JO"]
    var categoryArray = ["sports","business","health"]
    
    var selectedCountry = ""
    var selectedcategory = ""
    
    var newsViewModel:NewsViewModel
    
    init(newsViewModel:NewsViewModel) {
        self.newsViewModel = newsViewModel
    }
    
    func passTheFilterParams(){
        newsViewModel.country = self.selectedCountry
        newsViewModel.category = self.selectedcategory
        newsViewModel.isFilterOn = true
        newsViewModel.fetchData()
    }
    
    
}
