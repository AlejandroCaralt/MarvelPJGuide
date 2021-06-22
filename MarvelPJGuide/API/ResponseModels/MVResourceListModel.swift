//
//  MVResourceListModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVResourceListModel: APIModel, Codable {

    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [MVItemModel]?

    init() {}

    init(dic: [String: Any]) {

        self.available = dic["available"] as? Int
        self.returned = dic["returned"] as? Int
        self.collectionURI = dic["collectionURI"] as? String

        if let items = dic["items"] as? [[String: Any]] {
            self.items = MVItemModel.createArray(items)
        }
    }
}
