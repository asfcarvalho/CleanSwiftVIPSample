//
//  FamousRouter.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class FamousRoter: FamousRouterProtocol {
    
    class func createViewController() -> UIViewController {
        let interactor: FamousInteractorInputProtocol & FamousWorkerOutputProntocol = FamousInteractor()
        var worker: FamousWorkerInputProntocol = FamousWorker()
        let presenter: FamousPresenterProntocol & FamouseInteractorOutputProtocol = FamousPresenter()
        let router: FamousRouterProtocol = FamousRoter()
        
        let viewController = FamousViewController.init(nibName: nil, bundle: nil)
        
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        interactor.worker = worker
        worker.interactor = interactor
        
        return viewController
    }
    
    func showFamousDetail(from viewController: FamousViewController, famous: Famous) {
        
        viewController.navigationController?.pushViewController(DetailRouter.createViewController(famous), animated: true)
        
    }
}
