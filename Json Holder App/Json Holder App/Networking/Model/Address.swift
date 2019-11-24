//
//  Address.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation

// MARK: - Address
struct Address: Codable {
    var street, suite, city, zipcode: String?
    var geo: Geo?
}

// MARK: Address convenience initializers and mutators

extension Address {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Address.self, from: data)
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
        street: String?? = nil,
        suite: String?? = nil,
        city: String?? = nil,
        zipcode: String?? = nil,
        geo: Geo?? = nil
    ) -> Address {
        return Address(
            street: street ?? self.street,
            suite: suite ?? self.suite,
            city: city ?? self.city,
            zipcode: zipcode ?? self.zipcode,
            geo: geo ?? self.geo
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
