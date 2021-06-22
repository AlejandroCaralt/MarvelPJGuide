//
//  CharactersListPresenter.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//  Copyright (c) 2021 Alejandro Caralt. All rights reserved.
//

import UIKit

protocol CharactersListDisplayLogic: class {
    func setupView()
    func config(headerView model: String)
    func config(footerView model: String)
    func reloadCollection()
}

protocol CharactersListDataStore {
    var selectedCharacter: MVCharacterInfoModel? { get set }
}

class CharactersListPresenter: CharactersListPresenterLogic, CharactersListDataStore {

    weak var view: (CharactersListDisplayLogic & CharactersListRouterLogic)?

    var repository = MarvelRepository()
    var model = CharactersList.Model()
    var selectedCharacter: MVCharacterInfoModel?

    init() {
        repository.delegate = self
    }

    func setupView() {

        view?.setupView()
        view?.config(headerView: "characters_list_title".localized)

        getCharacters()
    }

    func getCollectionItems(section: Int) -> Int {
        return model.charactersList.count
    }

    func getCollectionCellModel(indexPath: IndexPath) -> CLCollectionCellModel? {

        guard model.charactersList.count > indexPath.row,
              let imageUrl = model.charactersList[indexPath.row].thumbnail?.getImageUrl(),
              let characterName = model.charactersList[indexPath.row].name else {
            return nil
        }

        return CLCollectionCellModel(imageUrl: imageUrl, bottomTitle: characterName)
    }

    func getCollectionInset() -> CGFloat {
        return model.inset
    }

    func getCollectionMinLineSpace() -> CGFloat {
        return model.minimumLineSpacing
    }

    func getCollectionMinInterSpace() -> CGFloat {
        return model.minimumInteritemSpacing
    }

    func getCollectionCellsPerRow() -> Int {
        return model.cellsPerRow
    }

    func collectionCellSelectedAt(indexPath: IndexPath) {

        guard model.charactersList.count > indexPath.row else { return }

        self.selectedCharacter = model.charactersList[indexPath.row]
        view?.navigateToCharacterDetail()
    }

    func calculatePagesInScroll(contentOffset: CGFloat, maximumOffset: CGFloat) {

        let scrollPosition = maximumOffset - contentOffset
        let isScrollBottom = scrollPosition <= model.bottomSpaceToReload

        if model.repositoryAvailable && isScrollBottom {
            getCharacters()
        }
    }

    private func getCharacters() {

        if let lastResponse = model.lastResponseModel {

            guard let offset = lastResponse.offset,
                  let total = lastResponse.total,
                  offset < total else {
                return
            }
        }

        let requestModel = MVCharactersRequestModel()
        requestModel.limit = model.maxCharactersPerLoad
        requestModel.offset = model.charactersList.count

        repository.getMarvelCharacters(model: requestModel)

        model.repositoryAvailable = false
    }
}

extension CharactersListPresenter: MarvelRepositoryDelegate {

    func getCharactersSuccess(model: MVAPIResponseModel) {

        self.model.lastResponseModel = model.data
        self.model.charactersList.append(contentsOf: model.data?.results ?? [])
        self.model.repositoryAvailable = true

        view?.config(footerView: model.attributionText ?? "")
        view?.reloadCollection()
    }

    func getCharactersError(error: APIError) {
        view?.popUpErrorAlert()
    }
}
