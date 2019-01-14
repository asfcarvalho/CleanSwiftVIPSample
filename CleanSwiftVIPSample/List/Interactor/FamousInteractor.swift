//
//  FamousInteractor.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class FamousInteractor: FamousInteractorInputProtocol {

    var presenter: FamouseInteractorOutputProtocol?
    var worker: FamousWorkerInputProntocol?
    
    func showListOfFamous() {
        worker?.fetchFamous()
    }
    
    func viewDidLoad() {
        presenter?.viewDidLoad()
    }
}

extension FamousInteractor: FamousWorkerOutputProntocol {
    func showListOfFamous(_ famous: [Famous]) {
        presenter?.showListOfFamous(famous)
    }
    
    func onError(_ error: String) {
        presenter?.showError(error)
    }
}
