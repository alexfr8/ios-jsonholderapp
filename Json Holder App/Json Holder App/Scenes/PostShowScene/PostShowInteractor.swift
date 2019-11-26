//
//  PostShowInteractor.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 26/11/2019.
//  Copyright (c) 2019 Alejandro Fernández Ruiz. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PostShowBusinessLogic {
    func setupView()
}

protocol PostShowDataStore {
    //var name: String { get set }
    var postData: Post? {get set}
}

class PostShowInteractor: PostShowBusinessLogic, PostShowDataStore {
    var postData: Post?
    
    
    var presenter: PostShowPresentationLogic?
    var worker: PostShowWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    //  func doSomething(request: PostShow.Something.Request)
    //  {
    //    worker = PostShowWorker()
    //    worker?.doSomeWork()
    //
    //    let response = PostShow.Something.Response()
    //    presenter?.presentSomething(response: response)
    //  }
    //
    func setupView() {
        worker = PostShowWorker()
        let response: PostShow.Models.Response = PostShow.Models.Response()
        presenter?.setupView(response: response)
    }
    
}