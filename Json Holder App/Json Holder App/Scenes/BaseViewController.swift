//
//  BaseViewController.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func showError(msg: String) {
        
        let alert = UIAlertController(title: "error.alert.title".localized, msg,         preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "error.alert.button.cancel", style: UIAlertActionStyle.default, handler: { _ in
            //Cancel Action
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
