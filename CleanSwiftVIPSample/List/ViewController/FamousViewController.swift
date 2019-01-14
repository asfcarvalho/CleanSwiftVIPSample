//
//  FamousViewController.swift
//  CleanSwiftVIPSample
//
//  Created by Anderson Carvalho on 14/01/19.
//  Copyright © 2019 asfcarvalho. All rights reserved.
//

import UIKit

class FamousViewController: UIViewController {

    var interactor: FamousInteractorInputProtocol?
    var router: FamousRouterProtocol?
    var famousView: FamouseView?
    let tableView = UITableView()
    var famous = [Famous]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        famousView = FamouseView(frame: self.view.bounds)
                
        setupTableView()
        
        interactor?.viewDidLoad()
        interactor?.showListOfFamous()
        
        self.view = famousView
    }
    
    private func setupTableView() {
        famousView?.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        famousView?.tableView.dataSource = self
        famousView?.tableView.delegate = self
    }
}

extension FamousViewController: FamousViewControllerProtocol {
    func showListOfFamous(_ famous: [Famous]) {
        self.famous = famous
        DispatchQueue.main.async {
            self.famousView?.tableView.reloadData()
        }
    }
    
    func showError(_ error: String) {
        let alert = UIAlertController(title: "Warning", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onLoading() {
        guard let view = famousView else {
            return
        }
        Loading.showLoading(view)
    }
    
    func stopLoading() {
        Loading.stopLoading()
    }
    
    
}


extension FamousViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return famous.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = famous[indexPath.row].author
        
        return cell
    }
    
    
    //Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.showFamousDetail(from: self, famous: famous[indexPath.row])
    }
}
