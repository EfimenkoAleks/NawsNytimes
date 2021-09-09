//
//  APIModel.swift
//  NewsNytimes
//
//  Created by user on 09.09.2021.
//

import Foundation

public struct APIModel: Codable {
    var results: [Articles]?
}

struct Articles: Codable {
    var id: Double?
    var source: String?
    var publishedDate: String?
    var title: String?
    var abstract: String?
    var media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case source
        case publishedDate = "published_date"
        case title
        case abstract
        case media
    }
}

struct Media: Codable {
    var mediaMetadata: [Photo]?
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct Photo: Codable {
    var url: String?
    var height: Int?
    var width: Int?
}
