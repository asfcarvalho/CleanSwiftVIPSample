//
//  DetailInteractor.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailInteractor: DetailInteractorInputProtocol {
    var famous: Famous?
    var presenter: DetailInteractorOutputProtocol?
    
    func showDetail() {
        guard let value = famous else { return }
        presenter?.showDetail(value)
    }
}
