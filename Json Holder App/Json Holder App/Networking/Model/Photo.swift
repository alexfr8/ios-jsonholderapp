//
//  Photo.swift
//  Json Holder App
//
//  Created by Alejandro Fernández Ruiz on 24/11/2019.
//  Copyright © 2019 Alejandro Fernández Ruiz. All rights reserved.
//

import Foundation

// MARK: - Photo
struct Photo: Codable {
    var albumID, id: Int?
    var title: String?
    var url, thumbnailURL: String?

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

// MARK: Photo convenience initializers and mutators

extension Photo {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Photo.self, from: data)
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
        albumID: Int?? = nil,
        id: Int?? = nil,
        title: String?? = nil,
        url: String?? = nil,
        thumbnailURL: String?? = nil
    ) -> Photo {
        return Photo(
            albumID: albumID ?? self.albumID,
            id: id ?? self.id,
            title: title ?? self.title,
            url: url ?? self.url,
            thumbnailURL: thumbnailURL ?? self.thumbnailURL
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}
