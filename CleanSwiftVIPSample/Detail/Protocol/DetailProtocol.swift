//
//  DetailProtocol.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

//ViewController -> Interactor
//Interactor -> Presenter
//Presenter -> ViewController

protocol DetailInteractorInputProtocol {
    
    var presenter: DetailInteractorOutputProtocol? { get set }
    var famous: Famous? { get set }
    
    //ViewController -> Interactor
    func showDetail()
}

protocol DetailInteractorOutputProtocol {
    
    //Interactor -> Presenter
    func showDetail(_ famous: Famous)
}

protocol DetailPresenterProtocol {
    var viewController: DetailViewControllerProtocol? { get set }
    
}

protocol DetailViewControllerProtocol {
    
    //Presenter -> ViewController
    func showDetail(_ famous: Famous)
}

protocol DetailRouterProtocol {
    
    static func createViewController(_ famous: Famous) -> UIViewController
}
