//
//  NewsTableViewDataSource.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation
import UIKit

class NewsTableViewDataSource : NSObject, UITableViewDataSource , UITableViewDelegate{

    var data = Observable<[NewCellViewModel]>([])
    private let identifier = "NewsCell"
    private let tableView : UITableView
    
    init(_ tableView: UITableView) {
         self.tableView = tableView
         super.init()
         registerCells()
         setup()
     }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.viewModel = data.value[indexPath.row]
        return cell
    }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.value.count
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: data.value[indexPath.row].link) {
            UIApplication.shared.open(url)
        }
    }
    
}


private extension NewsTableViewDataSource {
    func setup() {
        tableView.dataSource = self
        tableView.delegate = self
    }
}

private extension NewsTableViewDataSource {
    func registerCells(){
        self.tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")

    }
}
