//
//  ViewController+Extensions.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 07/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

extension UIViewController {
    func showErrorAlert(_ errorMessage: String = "") {
        let alert = UIAlertController(title: "", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true) {}
    }
}
