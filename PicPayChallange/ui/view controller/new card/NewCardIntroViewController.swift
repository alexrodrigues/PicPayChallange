//
//  NewCardIntroViewController.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 07/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit

class NewCardIntroViewController: UIViewController {
    
    // MARK: - Variables
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
}

// MARK: Instantiate from nib

extension NewCardIntroViewController {
    static func instantiateFromNib() -> NewCardIntroViewController {
        guard let viewController = UINib(
            nibName: "NewCardIntroViewController",
            bundle: Bundle.main
            ).instantiate(withOwner: nil, options: nil)[0] as? NewCardIntroViewController else {
                fatalError("Could not to find NewCardIntroViewController")
        }
        return viewController
    }
}
