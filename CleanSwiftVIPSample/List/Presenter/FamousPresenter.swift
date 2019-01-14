//
//  FamousPresenter.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class FamousPresenter: FamousPresenterProntocol {
    var viewController: FamousViewControllerProtocol?

}

extension FamousPresenter: FamouseInteractorOutputProtocol {
    func viewDidLoad() {
        viewController?.onLoading()
    }
    
    
    func showListOfFamous(_ famous: [Famous]) {
        viewController?.showListOfFamous(famous)
        viewController?.stopLoading()        
    }
    
    func showError(_ error: String) {
        viewController?.stopLoading()
        viewController?.showError(error)
    }
    
}
