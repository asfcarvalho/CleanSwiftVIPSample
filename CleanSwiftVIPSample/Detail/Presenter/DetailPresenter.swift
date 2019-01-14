//
//  DetailPresenter.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    var viewController: DetailViewControllerProtocol?
    
    
}

extension DetailPresenter: DetailInteractorOutputProtocol {
    func showDetail(_ famous: Famous) {
        viewController?.showDetail(famous)
    }
}
