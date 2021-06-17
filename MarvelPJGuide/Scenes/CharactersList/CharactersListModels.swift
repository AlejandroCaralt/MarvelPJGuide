//
//  CharactersListModels.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//  Copyright (c) 2021 Alejandro Caralt. All rights reserved.
//

import UIKit

enum CharactersList {

    struct Model {

        let inset: CGFloat = 15
        let minimumLineSpacing: CGFloat = 30
        let minimumInteritemSpacing: CGFloat = 30
        let cellsPerRow: Int = 2
        let maxCharactersPerLoad: Int = 20
        let bottomSpaceToReload: CGFloat = 150

        var lastResponseModel: MVCharactersResponseModel?
        var charactersList: [MVCharacterInfoModel] = []
        var repositoryAvailable: Bool = false
    }
}
