//
//  CharactersRequestModel.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation

enum MVShortOrder: String {
    case name = "name"
    case modified = "modified"
    case descName = "-name"
    case descModified = "-modified"
}

class MVCharactersRequestModel: Codable {

    var name: String?
    var nameStartsWith: String?
    var modifiedSince: Date?
    var comics: Int?
    var series: Int?
    var events: Int?
    var stories: Int?
    var orderBy: String?
    var limit: Int?
    var offset: Int?

    init() {}

    init(name: String? = nil, nameStartsWith: String? = nil, modifiedSince: Date? = nil, comics: Int? = nil, series: Int? = nil, events: Int? = nil, stories: Int? = nil, orderBy: String? = nil, limit: Int? = nil, offset: Int? = nil) {

        self.name = name
        self.nameStartsWith = nameStartsWith
        self.modifiedSince = modifiedSince
        self.comics = comics
        self.series = series
        self.events = events
        self.stories = stories
        self.orderBy = orderBy
        self.limit = limit
        self.offset = offset
    }
}
