//
//  APIConstants.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 15/06/2021.
//

import Foundation

class APIConstants {

    static let webProtocol = "https://"
    static let marvelDomain = "gateway.marvel.com"
    static let marvelURL = "\(webProtocol)\(marvelDomain)"

    enum EndPoint: String {
        case getCharacters = "/v1/public/characters"
        case getComics = "/v1/public/comics"
        case getCreators = "/v1/public/creators"
        case getEvents = "/v1/public/events"
        case getSeries = "/v1/public/series"
        case getStories = "/v1/public/stories"
    }

    enum MarvelAPIFilter: String {
        case characters = "/characters"
        case comics = "/comics"
        case creators = "/creators"
        case events = "/events"
        case series = "/series"
        case stories = "/stories"
    }
}
