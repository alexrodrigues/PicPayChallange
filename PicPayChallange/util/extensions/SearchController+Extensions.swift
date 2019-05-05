//
//  SearchController+Extensions.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 05/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

extension UISearchController {
    func setTextColor(color: UIColor) {
        let searchBarTextAttributes: [NSAttributedString.Key : AnyObject] = [NSAttributedString.Key(rawValue: NSAttributedString.Key.foregroundColor.rawValue): color, NSAttributedString.Key(rawValue: NSAttributedString.Key.font.rawValue): UIFont.systemFont(ofSize: 14.0)]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = searchBarTextAttributes
    }
}
