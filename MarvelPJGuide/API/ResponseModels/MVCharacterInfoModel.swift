//
//  MVCharacterInfoModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

final class MVCharacterInfoModel: APIModel, Codable {

    var id: Int?
    var name: String?
    var description: String?
    var modified: Date?
    var resourceURI: String?
    var urls: [MVItemURLModel]?
    var thumbnail: MVImageModel?
    var comics: MVResourceListModel?
    var stories: MVResourceListModel?
    var events: MVResourceListModel?
    var series: MVResourceListModel?

    init() {}

    init(dic: [String: Any]) {

        self.id = dic["id"] as? Int
        self.name = dic["name"] as? String
        self.description = dic["description"] as? String
        self.resourceURI = dic["resourceURI"] as? String

        if let modifiedDate = dic["modified"] as? String {
            self.modified = modifiedDate.date("yyyy-MM-dd'T'HH:mm:ssZ")
        }

        if let urls = dic["urls"] as? [[String: Any]] {
            self.urls = MVItemURLModel.createArray(urls)
        }

        if let thumbnail = dic["thumbnail"] as? [String: Any] {
            self.thumbnail = MVImageModel(dic: thumbnail)
        }

        if let comics = dic["comics"] as? [String: Any] {
            self.comics = MVResourceListModel(dic: comics)
        }

        if let stories = dic["stories"] as? [String: Any] {
            self.stories = MVResourceListModel(dic: stories)
        }

        if let events = dic["events"] as? [String: Any] {
            self.events = MVResourceListModel(dic: events)
        }

        if let series = dic["series"] as? [String: Any] {
            self.series = MVResourceListModel(dic: series)
        }
    }
}
