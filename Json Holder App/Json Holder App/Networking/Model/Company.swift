//
//  Company.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation


// MARK: - Company
struct Company: Codable {
    var name, catchPhrase, bs: String?
}

// MARK: Company convenience initializers and mutators

extension Company {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Company.self, from: data)
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
        name: String?? = nil,
        catchPhrase: String?? = nil,
        bs: String?? = nil
    ) -> Company {
        return Company(
            name: name ?? self.name,
            catchPhrase: catchPhrase ?? self.catchPhrase,
            bs: bs ?? self.bs
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
