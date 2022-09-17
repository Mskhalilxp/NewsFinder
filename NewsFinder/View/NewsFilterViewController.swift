//
//  NewsFilterViewController.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import UIKit

class NewsFilterViewController: UIViewController {

    @IBOutlet weak var categoryTf: UITextField!
    @IBOutlet weak var countryTf: UITextField!
    
    private var counterPickerView = UIPickerView()
    private var categoryPickerView = UIPickerView()
    
    var newsFilterViewModel : FilterNewViewModel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    
    private func setupUI(){
        counterPickerView.dataSource = self
        counterPickerView.delegate = self

      
        countryTf.addDoneButtonOnKeyboard()
        countryTf.inputView = counterPickerView
        
        categoryPickerView.dataSource = self
        categoryPickerView.delegate = self
        categoryTf.addDoneButtonOnKeyboard()
    
        categoryTf.inputView = categoryPickerView
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        newsFilterViewModel.newsViewModel.clearFilter()
        self.dismiss(animated: true)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        newsFilterViewModel.passTheFilterParams()
        self.dismiss(animated: true)
    }
    

}


extension NewsFilterViewController : UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == counterPickerView {
            return newsFilterViewModel.countryArray.count
        } else if pickerView == categoryPickerView {
            return newsFilterViewModel.categoryArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == counterPickerView {
            return newsFilterViewModel.countryArray[row]
            self.resignFirstResponder()
        } else if pickerView == categoryPickerView {
            return newsFilterViewModel.categoryArray[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == counterPickerView {
            countryTf.text = newsFilterViewModel.countryArray[row]
            newsFilterViewModel.selectedCountry = newsFilterViewModel.countryArray[row]
            self.resignFirstResponder()
        } else if pickerView == categoryPickerView {
            categoryTf.text = newsFilterViewModel.categoryArray[row]
            newsFilterViewModel.selectedcategory = newsFilterViewModel.categoryArray[row]
        }
        self.resignFirstResponder()
    }
  
    
}
