//
//  CommentTableCell.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 28/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import UIKit

class CommentTableCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblBody: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }

   static var cellIdentifier: String {
        return String(describing: CommentTableCell.self)
    }

    func setupView() {
        selectionStyle = .none
    }

    func updateUI(data: PostShow.Models.CommentCellData) {
      
        self.lblEmail.text = data.email
        self.lblName.text = data.name
        self.lblBody.text = data.body
    }

}
