//
//  UserCollectionCell.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import UIKit

class PostCollectionCell: UICollectionViewCell {

    @IBOutlet weak var post: UILabel!
    @IBOutlet weak var bgView: UIView!    
    static var cellIdentifier: String {
        return String(describing: PostCollectionCell.self)
    }

    func updateUI(postName: String) {

        self.applyStyle()
        self.post.text = postName
    }

    func applyStyle() {
       
        post.textColor = UIColor.greenPersonal
        bgView.backgroundColor = UIColor.grayPersonal
    }
}
