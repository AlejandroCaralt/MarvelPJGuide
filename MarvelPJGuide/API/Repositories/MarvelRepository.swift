//
//  MarvelRepository.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 15/06/2021.
//

import Foundation
import Alamofire

protocol MarvelRepositoryDelegate: class {
    func getCharactersSuccess(model: MVAPIResponseModel)
    func getCharactersError(error: APIError)
    func getCharacterDetailSuccess(model: MVCharacterInfoModel)
    func getCharacterDetailError(error: APIError)
}

extension MarvelRepositoryDelegate {
    func getCharactersSuccess(model: MVAPIResponseModel) {}
    func getCharactersError(error: APIError) {}
    func getCharacterDetailSuccess(model: MVCharacterInfoModel) {}
    func getCharacterDetailError(error: APIError) {}
}

class MarvelRepository: API {

    weak var delegate: MarvelRepositoryDelegate?

    func getMarvelCharacters(model: MVCharactersRequestModel) {

        guard let authentication = try? MVAPIAuthenticationModel().asDictionary() else {
            delegate?.getCharactersError(error: APIError())
            return
        }

        let headers: HTTPHeaders = configHeaders()

        guard let params: Parameters = try? model.asDictionary() else {
            delegate?.getCharactersError(error: APIError())
            return
        }

        let request: URLConvertible = "\(APIConstants.marvelURL)\(APIConstants.EndPoint.getCharacters.rawValue)?\(authentication.queryString)&\(params.queryString)"

        AF.request(request, headers: headers).validate().responseJSON(completionHandler: { [weak self] (response) in

            guard response.error == nil else {

                self?.delegate?.getCharactersError(error: self?.getCustomError(error: response.error) ?? APIError())
                return
            }

            guard let json = response.value as? [String: Any],
                  let responseCode = json["code"] as? Int else {

                self?.delegate?.getCharactersError(error: APIError())
                return
            }

            guard responseCode.isAcceptableCode() else {

                let description = json["status"] as? String ?? ""
                self?.delegate?.getCharactersError(error: APIError(errorCode: responseCode, description: description))
                return
            }

            if (json["data"] as? [String: Any]) != nil {

                let characters = MVAPIResponseModel(dic: json)
                self?.delegate?.getCharactersSuccess(model: characters)

            } else {

                self?.delegate?.getCharactersError(error: APIError())
            }
        })
    }

    func getMarvelCharacterDetail(characterId: Int) {

        guard let authentication = try? MVAPIAuthenticationModel().asDictionary() else {
            delegate?.getCharacterDetailError(error: APIError())
            return
        }

        let headers: HTTPHeaders = configHeaders()

        let params: Parameters = ["characterId": characterId]

        let request: URLConvertible = "\(APIConstants.marvelURL)\(APIConstants.EndPoint.getCharacters.rawValue)?\(authentication.queryString)\(params.queryString)"

        AF.request(request, headers: headers).validate().responseJSON(completionHandler: { [weak self] (response) in

            guard response.error == nil else {

                self?.delegate?.getCharacterDetailError(error: self?.getCustomError(error: response.error) ?? APIError())
                return
            }

            guard let json = response.value as? [String: Any],
                  let responseCode = json["code"] as? Int else {

                self?.delegate?.getCharacterDetailError(error: APIError())
                return
            }

            guard responseCode.isAcceptableCode() else {

                let description = json["status"] as? String ?? ""
                self?.delegate?.getCharacterDetailError(error: APIError(errorCode: responseCode,
                                                                        description: description))
                return
            }

            if let data = json["data"] as? [String: Any],
               let results = data["results"] as? [[String: Any]],
               let characterDic = results.first {

                let character = MVCharacterInfoModel(dic: characterDic)
                self?.delegate?.getCharacterDetailSuccess(model: character)

            } else {

                self?.delegate?.getCharacterDetailError(error: APIError())
            }
        })
    }
}
