//
//  CharacterDetailPresenter.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//  Copyright (c) 2021 Alejandro Caralt. All rights reserved.
//

protocol CharacterDetailDisplayLogic: class {
    func setupView()
    func config(headerView: CDHeaderViewModel)
    func config(descriptionView: CDDescriptionViewModel?)
    func config(itemView: CharacterDetail.MultipleItemsView, model: CDMultipleItemsViewModel?)
}

protocol CharacterDetailDataStore {
    var characterModel: MVCharacterInfoModel { get set }
}

class CharacterDetailPresenter: CharacterDetailPresenterLogic, CharacterDetailDataStore {

    weak var view: (CharacterDetailDisplayLogic & CharacterDetailRouterLogic)?

    var characterModel: MVCharacterInfoModel = MVCharacterInfoModel()

    func setupView() {
        view?.setupView()

        configViews()
    }

    func configViews() {

        guard let name = characterModel.name,
              let thumbnail = characterModel.thumbnail else { return }
        view?.config(headerView: CDHeaderViewModel(headerTitle: name, imageUrl: thumbnail.getImageUrl() ?? ""))

        var descriptionViewModel: CDDescriptionViewModel?
        if let description = characterModel.description,
           !description.isEmpty {
            descriptionViewModel = CDDescriptionViewModel(titleText: "character_detail_description".localized,
                                                          descriptionText: description)
        } else {
            descriptionViewModel = nil
        }
        view?.config(descriptionView: descriptionViewModel)

        var comicsViewModel: CDMultipleItemsViewModel?
        if let comics = characterModel.comics?.items {

            let comicsString: [String] = comics.map({ return $0.name ?? "" })
            comicsViewModel = CDMultipleItemsViewModel(titleText: "character_detail_comics".localized,
                                                       items: comicsString)
        } else {
            comicsViewModel = nil
        }
        view?.config(itemView: .comic, model: comicsViewModel)

        var seriesViewModel: CDMultipleItemsViewModel?
        if let series = characterModel.series?.items {

            let seriesString: [String] = series.map({ return $0.name ?? "" })
            seriesViewModel = CDMultipleItemsViewModel(titleText: "character_detail_series".localized,
                                                       items: seriesString)
        } else {
            seriesViewModel = nil
        }
        view?.config(itemView: .serie, model: seriesViewModel)

        var eventsViewModel: CDMultipleItemsViewModel?
        if let events = characterModel.events?.items {

            let eventsString: [String] = events.map({ return $0.name ?? "" })
            eventsViewModel = CDMultipleItemsViewModel(titleText: "character_detail_events".localized,
                                                       items: eventsString)
        } else {
            eventsViewModel = nil
        }
        view?.config(itemView: .event, model: eventsViewModel)

        var storiesViewModel: CDMultipleItemsViewModel?
        if let stories = characterModel.stories?.items {

            let storiesString: [String] = stories.map({ return $0.name ?? "" })
            storiesViewModel = CDMultipleItemsViewModel(titleText: "character_detail_stories".localized,
                                                        items: storiesString)
        } else {
            storiesViewModel = nil
        }
        view?.config(itemView: .story, model: storiesViewModel)
    }

    func closeButtonTapped() {
        view?.navigateToBack()
    }
}
