//
//  Todo.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//


import Foundation

// MARK: - Todo
struct Todo: Codable {
    var userID, id: Int?
    var title: String?
    var completed: Bool?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

// MARK: Todo convenience initializers and mutators

extension Todo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Todo.self, from: data)
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
        userID: Int?? = nil,
        id: Int?? = nil,
        title: String?? = nil,
        completed: Bool?? = nil
    ) -> Todo {
        return Todo(
            userID: userID ?? self.userID,
            id: id ?? self.id,
            title: title ?? self.title,
            completed: completed ?? self.completed
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
