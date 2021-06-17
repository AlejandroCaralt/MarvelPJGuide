//
//  ViewReference.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import Foundation
import UIKit

struct Scene {
    let storyboard: String
    let sceneId: String

    init(storyboard: String, sceneId: String) {
        self.storyboard = storyboard
        self.sceneId = sceneId
    }

    func scene() -> UIViewController? {

        let story = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = story.instantiateViewController(withIdentifier: sceneId)

        return viewController
    }
}

struct ViewReference {

    static let charactersList = Scene(storyboard: "CharactersList", sceneId: "CharactersListViewController")
    static let characterDetail = Scene(storyboard: "CharacterDetail", sceneId: "CharacterDetailViewController")
}
