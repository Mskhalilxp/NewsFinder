//
//  UITableView+DequeueReusableCell.swift
//  NewsFinder
//
//  Created by Mennatallah Abuzanoneh on 16/09/2022.
//

import Foundation
import UIKit

extension UITableView {
    
    public func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T else {
            fatalError("Couldn't find UITableViewCell of class \(type.className)")
        }
        return cell
    }
    
}


extension NSObject {
    
    /// String describing the class name.
    static var className: String {
        return String(describing: self)
    }
    
}
