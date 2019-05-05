//
//  ContactsViewModel.swift
//  PicPayChallange
//
//  Created by Alex Rodrigues on 04/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ContactsViewModel {
    
    // MARK: - Variables to Observe
    
    var contacts = BehaviorRelay<[UserViewModel]>(value: [UserViewModel]())
    var errorMessage = BehaviorRelay<String>(value: "")
    
    // MARK: - Variables private to this ViewModel
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Methods to query
    
    func fetch() {
        UserService().fetch()
            .subscribe(onNext: { viewModels in
                self.contacts.accept(viewModels)
            }, onError: { error in
                self.errorMessage.accept(error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    func filter(basedOn text: String) -> [UserViewModel] {
        return contacts.value.filter { $0.name.contains(text) }
    }
}
