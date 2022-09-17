//
//  ViewController.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private let sessionProvider = URLSessionProvider()
    
    private lazy var dataSource = NewsTableViewDataSource(tableView)
    private lazy var viewModel = NewsViewModel(data: dataSource.data)
    
    var category = ""
    var country = ""
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.category = category
        viewModel.country = country
        
        fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    
        let notificationBtn = UIButton()
        notificationBtn.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        notificationBtn.setImage(UIImage(named: "filter"), for: .normal)
        notificationBtn.imageView?.contentMode = .scaleAspectFit
        
        let notificationBtnItem = UIBarButtonItem(customView: notificationBtn)
        let notificationBtnItemWidth = notificationBtnItem.customView?.widthAnchor.constraint(equalToConstant: 25)
        notificationBtnItemWidth?.isActive = true
        let notificationBtnItemHeight = notificationBtnItem.customView?.heightAnchor.constraint(equalToConstant: 25)
        notificationBtnItemHeight?.isActive = true
        
        self.navigationItem.rightBarButtonItems = [notificationBtnItem]
        self.navigationItem.title = "NewsFinder"

        //self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        
   }
    
    
    @objc func rightButtonTapped(){
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "NewsFilterViewController") as! NewsFilterViewController
        let filterViewModel = FilterNewViewModel(newsViewModel: self.viewModel)
        viewController.newsFilterViewModel = filterViewModel
        self.navigationController?.present(viewController, animated: true)
        
    }

    
//    func fetchData(){
//        URLCache.shared.removeAllCachedResponses()
//
//        sessionProvider.request(type: NewsApiModel.self, service: PostService.NewsApi) { [weak self] response in
//            DispatchQueue.main.async {
//            guard let self = self else { return }
//            //self.isLoading.value = false
//            switch response {
//            case let .success(items):
//                print(items)
//                print("==== success")
//
//            case let .failure(error):
//                print(error.errorDescription)
//            }
//            }
//        }
//    }
//
//    func fetchData2(){
//        URLCache.shared.removeAllCachedResponses()
//
//        sessionProvider.request(type: NewDataModel.self, service: PostService.NewsData) { [weak self] response in
//            DispatchQueue.main.async {
//            guard let self = self else { return }
//            //self.isLoading.value = false
//            switch response {
//            case let .success(items):
//                print(items)
//                print("==== success")
//
//            case let .failure(error):
//                print(error.errorDescription)
//                print(error)
//            }
//            }
//        }
//    }

}




//extension HomeViewController : UITableViewDelegate,UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//    }
//    
//    
//}
private extension HomeViewController {
    
    func setup(){
        viewModel.dataSource.bind { [weak self] _ in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
                    
        
    }
    
    func fetchData(){
        self.viewModel.fetchData()
    }

}
