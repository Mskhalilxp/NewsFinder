//
//  NewsCell.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {
    

    @IBOutlet weak var imageIv: UIImageView!
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    @IBOutlet weak var authorLb: UILabel!
    
    var viewModel: NewCellViewModel! {
        didSet{
            titleLb.text = viewModel.title
            authorLb.text = viewModel.author
            dateLb.text = viewModel.getNewDataFormat()
            
            if let imageUrl = viewModel.imageUrl,let url = URL(string: imageUrl) {
                imageIv.sd_setImage(with: url, completed: nil)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
