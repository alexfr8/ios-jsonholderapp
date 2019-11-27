//
//  PostShowViewController.swift
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

protocol PostShowDisplayLogic: class {
    func setupView(viewModel: PostShow.Models.ViewModel)
    func doClose()
    func showPost(viewModel: PostShow.Models.ViewModel)
    func showError(msg: String)
    func reloadTable()
}

class PostShowViewController: BaseViewController{
    
    var interactor: PostShowBusinessLogic?
    var router: (NSObjectProtocol & PostShowRoutingLogic & PostShowDataPassing)?
    
    
    //IBOUTLETS
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var lblPost: UILabel!
    @IBOutlet weak var btnClose: UIButton!
    @IBOutlet weak var tableView: UITableView!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = PostShowInteractor()
        let presenter = PostShowPresenter()
        let router = PostShowRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    //    {
    //        if let scene = segue.identifier {
    //            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
    //            if let router = router, router.responds(to: selector) {
    //                router.perform(selector, with: segue)
    //            }
    //        }
    //    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        interactor?.setupView()
    }
    
    // MARK: Do something
    
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    @IBAction func btnCloseAction(_ sender: Any) {
        interactor?.closeDialog()
    }
    
}

extension PostShowViewController :  PostShowDisplayLogic  {

    
    func setupView(viewModel: PostShow.Models.ViewModel) {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CommentTableCell.self, forCellReuseIdentifier: "CommentTableCell")
        tableView.rowHeight = UITableView.automaticDimension
        view.backgroundColor = UIColor.blackTraslucid
        view.isOpaque = false
        
        self.interactor?.getComments()
        
    }
    
    func showPost(viewModel: PostShow.Models.ViewModel) {
        self.lblPost.text = viewModel.title
    }
    func doClose() {
        router?.performCloseNavigation()
    }
}

extension PostShowViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.getCommentCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableCell.cellIdentifier) as? CommentTableCell else {
            return UITableViewCell()
        }
        
        let commentData: PostShow.Models.CommentCellData = self.interactor?.getDataForCommentCell(index: indexPath.row) ?? PostShow.Models.CommentCellData()
        cell.updateUI(data: commentData)
        
        return cell
    }
    
    func reloadTable() {
        self.tableView.reloadData()
    }
}



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
