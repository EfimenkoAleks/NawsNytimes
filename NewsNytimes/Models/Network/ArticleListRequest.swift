//
//  ArticleListRequest.swift
//  NewsNytimes
//
//  Created by user on 07.09.2021.
//

// https://www.nytimes.com/images/2021/09/05/upshot/05up-cities-dense-print1/merlin_171685083_48467f0c-0c5e-4690-86a1-fa17bb31f36e-articleLarge.jpg?api-key=75dada23-43a5-431f-9159-e86155e3ac0e

import Foundation

public struct ArticleListRequest: Codable {
    var abstract: String?
    var leadParagraph: String?
    var id: String?
    var multimedia: [Multimedia]?
    
    enum CodingKeys: String, CodingKey {
        case abstract
        case leadParagraph = "lead_paragraph"
        case id = "_id"
        case multimedia
    }
}

struct Multimedia: Codable {
    var url: String
}
