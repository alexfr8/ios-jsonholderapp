//
//  MainInteractor.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright (c) 2019 Alejandro Fernández Ruiz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainBusinessLogic {
    func setupView()
    func getAllUsers()
    func userSelected(userId: Int)
}

protocol MainDataStore {
    
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    
    
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    
    func setupView() {
        let response: Main.Models.Response = Main.Models.Response()
        presenter?.setupView(response: response)
    }
    
    func getAllUsers()  {
        worker = MainWorker()
        worker?.getAllUsers(completionHandler: {[weak self] (userList, errorString) in
            if errorString.isEmpty {
                
            } else {
                let response = Main.Models.Response()
                self?.presenter?.presentAllUser(response: response)
            }
        })
    }
    
    func userSelected(userId: Int) {
        worker = MainWorker()
        worker?.getPostByUserAndTodos(userId: userId, completionHandler: { [weak self] (todoList, postList, errorString) in
            if errorString.isEmpty {
                
            } else {
                
            }
        })
    }
    
    
}