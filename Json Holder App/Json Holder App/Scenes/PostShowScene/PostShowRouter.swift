//
//  PostShowRouter.swift
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

@objc protocol PostShowRoutingLogic
{
    func performCloseNavigation()
}

protocol PostShowDataPassing
{
    var dataStore: PostShowDataStore? { get set }
}

class PostShowRouter: NSObject, PostShowRoutingLogic, PostShowDataPassing
{
    
    
    weak var viewController: PostShowViewController?
    var dataStore: PostShowDataStore?
    
    // MARK: Routing
    
    func performCloseNavigation() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Navigation
    
    //func navigateToSomewhere(source: PostShowViewController, destination: SomewhereViewController)
    //{
    //  source.show(destination, sender: nil)
    //}
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: PostShowDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}
