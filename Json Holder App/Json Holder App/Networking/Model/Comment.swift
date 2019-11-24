//
//  Comment.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation

// MARK: - Comment
struct Comment: Codable {
    var postID, id: Int?
    var name, email, body: String?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}

// MARK: Comment convenience initializers and mutators

extension Comment {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Comment.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        postID: Int?? = nil,
        id: Int?? = nil,
        name: String?? = nil,
        email: String?? = nil,
        body: String?? = nil
    ) -> Comment {
        return Comment(
            postID: postID ?? self.postID,
            id: id ?? self.id,
            name: name ?? self.name,
            email: email ?? self.email,
            body: body ?? self.body
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
