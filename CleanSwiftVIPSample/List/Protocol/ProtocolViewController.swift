//
//  ProtocolViewController.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

//ViewController -> Interacotor
//Interactor -> Worker
//Worker -> Interactor
//Interactor -> Presenter
//Presenter -> ViewController
//ViewController -> Router

protocol FamousInteractorInputProtocol: class {
    
    var worker: FamousWorkerInputProntocol? { get set}
    var presenter: FamouseInteractorOutputProtocol? { get set}
    
    //ViewController -> Interactor
    func showListOfFamous()
    func viewDidLoad()
}

protocol FamousWorkerInputProntocol {
    
    var interactor: FamousWorkerOutputProntocol? { get set }
    
    //Interactor -> Worker
    func fetchFamous()
}

protocol FamousWorkerOutputProntocol {
    
    //Worker -> Interactor
    func showListOfFamous(_ famous: [Famous])
    func onError(_ error: String)
}

protocol FamouseInteractorOutputProtocol {
        
    //Interactor -> Presenter
    func showListOfFamous(_ famous: [Famous])
    func showError(_ eror: String)
    func viewDidLoad()
}

protocol FamousPresenterProntocol: class {
    
    var viewController: FamousViewControllerProtocol? { get set }
    
    //Presenter -> ViewController
    func showListOfFamous(_ famous: [Famous])
    func showError(_ error: String)
}

protocol FamousViewControllerProtocol {
    
    func showListOfFamous(_ famous: [Famous])
    func showError(_ error: String)
    func onLoading()
    func stopLoading()
}

protocol FamousRouterProtocol {
    
    static func createViewController() -> UIViewController
    
    //ViewController -> Router
    func showFamousDetail(from viewController: FamousViewController, famous: Famous)
}
