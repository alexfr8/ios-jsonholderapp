//
//  PostShowWorker.swift
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

class PostShowWorker
{
    func getCommentsForPost(postId: Int, completionHandler: @escaping ([Comment], String) -> Void) {
        JSONHolderManager.shared.fetchCommentsByPostId(postId: postId) { (commentsResult) in
            switch commentsResult {
                
            case .Success(let result):
                completionHandler(result,"")
            case .Failure(let error):
                completionHandler([], error)
            }
        }
    }
    
}