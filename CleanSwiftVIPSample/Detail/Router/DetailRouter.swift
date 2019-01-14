//
//  DetailRouter.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    class func createViewController(_ famous: Famous) -> UIViewController {
        
        var interactor: DetailInteractorInputProtocol = DetailInteractor()
        var presenter: DetailPresenterProtocol & DetailInteractorOutputProtocol = DetailPresenter()
        
        let viewController = DetailViewController.init(nibName: nil, bundle: nil)
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.famous = famous
        presenter.viewController = viewController
        
        return viewController
    }
}
