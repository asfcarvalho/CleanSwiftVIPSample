//
//  DetailViewController.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var interactor: DetailInteractorInputProtocol?
    
    var detailView: DetailView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView = DetailView(frame: self.view.bounds)
        
        self.view = detailView
        
        interactor?.showDetail()
    }
}

extension DetailViewController: DetailViewControllerProtocol {
    func showDetail(_ famous: Famous) {
        detailView?.authorText.text = famous.author
        detailView?.categoryText.text = famous.category
        detailView?.quoteText.text = famous.quote
    }
}
