//
//  MVItemModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVItemModel: APIModel, Codable {

    var resourceURI: String?
    var name: String?
    var type: String?

    init() {}

    init(dic: [String: Any]) {
        self.resourceURI = dic["resourceURI"] as? String
        self.name = dic["name"] as? String
        self.type = dic["type"] as? String
    }
}
