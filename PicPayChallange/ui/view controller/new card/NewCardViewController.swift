//
//  NewCardViewController.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 08/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class NewCardViewController: UIViewController {

    // MARK: - Variables
    
    // MARK: - Outlets
    
    @IBOutlet weak var viewContainer: UIView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    // MARK: - Presentation
    
    private func configureView() {
        let tapGestureResignation = UITapGestureRecognizer(target: self, action: #selector(NewCardViewController.hideKeyboards))
        tapGestureResignation.numberOfTapsRequired = 1
        viewContainer.addGestureRecognizer(tapGestureResignation)
    }
    
    @objc func hideKeyboards() {
        view.endEditing(true)
    }
}

// MARK: Instantiate from nib

extension NewCardViewController {
    static func instantiateFromNib() -> NewCardViewController {
        guard let viewController = UINib(
            nibName: "NewCardViewController",
            bundle: Bundle.main
            ).instantiate(withOwner: nil, options: nil)[0] as? NewCardViewController else {
                fatalError("Could not to find NewCardIntroViewController")
        }
        return viewController
    }
}
