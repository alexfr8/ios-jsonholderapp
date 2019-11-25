//
//  UserCollectionCell.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import UIKit

class TodoCollectionCell: UICollectionViewCell {

    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    static var cellIdentifier: String {
        return String(describing: TodoCollectionCell.self)
    }

    func updateUI(username: String) {

        self.applyStyle()
        self.user.text = username
    }

    func applyStyle() {
       
        user.textColor = UIColor.greenPersonal
        bgView.backgroundColor = UIColor.orange
    }
}
