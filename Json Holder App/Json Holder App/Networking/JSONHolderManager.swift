//
//  JSONHolderManager.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation

// Enum to know jsonholder  operation result.
//
// - Success: Operation finish without error
// - Failure: Operation finish with error
enum JSONHolderRequestResult<U> {
    
    case Success(result: U)
    case Failure(error: String)
}

class JSONHolderManager {
    static let shared = JSONHolderManager()
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private init() {}
    
    func fetchUsers(completionHandler: @escaping (JSONHolderRequestResult<[User]>) -> Void) {
        let tail: String = "/users"
        
        if let url = URL(string: String(format: "%@%@", baseURL,tail)) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                ui {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodeUsers = try decoder.decode([User].self, from: data)
                            completionHandler(JSONHolderRequestResult.Success(result: decodeUsers))
                        } catch {
                            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingusers".localized))
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingusers".localized))
        }
    }
    
    func fetchPostsById(userId: Int, completionHandler: @escaping (JSONHolderRequestResult<[Post]>) -> Void) {
        let tail: String = "/posts?userId="
        
        if let url = URL(string: String(format: "%@%@%@", baseURL,tail, userId)) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                ui {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedPosts = try decoder.decode([Post].self, from: data)
                            completionHandler(JSONHolderRequestResult.Success(result: decodedPosts))
                        } catch {
                            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingposts".localized))
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingposts".localized))
        }
    }
    
    func fetchCommentsByPostId(postId: Int, completionHandler: @escaping (JSONHolderRequestResult<[Post]>) -> Void) {
        let tail: String = "/comments?postId="
        
        if let url = URL(string: String(format: "%@%@%@", baseURL, tail, "\(postId)")) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                ui {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedPosts = try decoder.decode([Post].self, from: data)
                            completionHandler(JSONHolderRequestResult.Success(result: decodedPosts))
                        } catch {
                            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingcommentsbypost".localized))
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingcommentsbypost".localized))
        }
    }
    
    func fetchAlbumsByUserId(userId: Int, completionHandler: @escaping (JSONHolderRequestResult<[Album]>) -> Void) {
        let tail: String = "/albums?userId="
        
        if let url = URL(string: String(format: "%@%@%@", baseURL, tail, "\(userId)")) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                ui {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedAlbums = try decoder.decode([Album].self, from: data)
                            completionHandler(JSONHolderRequestResult.Success(result: decodedAlbums))
                        } catch {
                            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingalbumsbyuser".localized))
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingalbumsbyuser".localized))
        }
    }
    
    func fetchPhotosByAlbumId(albumId: Int, completionHandler: @escaping (JSONHolderRequestResult<[Photo]>) -> Void) {
        let tail: String = "/photos?albumId="
        
        if let url = URL(string: String(format: "%@%@%@", baseURL, tail, "\(albumId)")) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                ui {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedAlbums = try decoder.decode([Photo].self, from: data)
                            completionHandler(JSONHolderRequestResult.Success(result: decodedAlbums))
                        } catch {
                            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingphotosbyalbumid".localized))
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingphotosbyalbumid".localized))
        }
    }
    
    func fetchTodosByUserId(userId: Int, completionHandler: @escaping (JSONHolderRequestResult<[Todo]>) -> Void) {
        let tail: String = "/todos?userId="
        if let url = URL(string: String(format: "%@%@%@", baseURL, tail, "\(userId)")) {
            let dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                ui {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let decodedAlbums = try decoder.decode([Todo].self, from: data)
                            completionHandler(JSONHolderRequestResult.Success(result: decodedAlbums))
                        } catch {
                            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingtodosbyuserid".localized))
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            completionHandler(JSONHolderRequestResult.Failure(error: "networking.error.downloadingtodosbyuserid".localized))
        }
    }
}
