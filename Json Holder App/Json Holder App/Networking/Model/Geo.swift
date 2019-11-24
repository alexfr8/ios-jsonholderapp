//
//  Geo.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation

// MARK: - Geo
struct Geo: Codable {
    var lat, lng: String?
}

// MARK: Geo convenience initializers and mutators

extension Geo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Geo.self, from: data)
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
        lat: String?? = nil,
        lng: String?? = nil
    ) -> Geo {
        return Geo(
            lat: lat ?? self.lat,
            lng: lng ?? self.lng
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
