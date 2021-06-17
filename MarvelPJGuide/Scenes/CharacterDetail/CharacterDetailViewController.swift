//
//  CharacterDetailViewController.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//  Copyright (c) 2021 Alejandro Caralt. All rights reserved.
//

import UIKit

protocol CharacterDetailPresenterLogic {
    func setupView()
    func closeButtonTapped()
}

class CharacterDetailViewController: UIViewController {
    var presenter: CharacterDetailPresenterLogic?
    var dataStore: CharacterDetailDataStore?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var headerView: CDHeaderView!
    @IBOutlet weak var descriptionView: CDDescriptionView!
    @IBOutlet weak var comicsView: CDMultipleItemsView!
    @IBOutlet weak var seriesView: CDMultipleItemsView!
    @IBOutlet weak var storiesView: CDMultipleItemsView!
    @IBOutlet weak var eventsView: CDMultipleItemsView!

    // MARK: Object lifecycle
  
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }
  
    // MARK: Setup
  
    func setupScene() {
        let viewController = self
        let presenter = CharacterDetailPresenter()
        
        presenter.view = viewController
        viewController.dataStore = presenter
        self.presenter = presenter
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        presenter?.closeButtonTapped()
    }
}

// MARK: - Display Logic

extension CharacterDetailViewController: CharacterDetailDisplayLogic {

    func setupView() {
        
        closeButton.setImage("close-button".image.withRenderingMode(.alwaysOriginal), for: .normal)
        scrollView.bounces = false
    }

    func config(headerView: CDHeaderViewModel) {

        DispatchQueue.main.async { [weak self] in
            
            self?.headerView.config(model: headerView)
        }
    }

    func config(descriptionView: CDDescriptionViewModel?) {

        DispatchQueue.main.async { [weak self] in
            
            if let model = descriptionView {
                self?.descriptionView.config(model: model)
            } else {
                self?.descriptionView.isHidden = true
            }
        }
    }

    func config(itemView: CharacterDetail.MultipleItemsView, model: CDMultipleItemsViewModel?) {
        
        switch itemView {
        case .comic:
            
            DispatchQueue.main.async { [weak self] in

                if let model = model {
                    self?.comicsView.config(model: model)
                } else {
                    self?.comicsView.isHidden = true
                }
            }
        case .serie:
            
            DispatchQueue.main.async { [weak self] in

                if let model = model {
                    self?.seriesView.config(model: model)
                } else {
                    self?.seriesView.isHidden = true
                }
            }
        case .event:
            
            DispatchQueue.main.async { [weak self] in

                if let model = model {
                    self?.eventsView.config(model: model)
                } else {
                    self?.eventsView.isHidden = true
                }
            }
        case .story:
            
            DispatchQueue.main.async { [weak self] in

                if let model = model {
                    self?.storiesView.config(model: model)
                } else {
                    self?.storiesView.isHidden = true
                }
            }
        }
    }
}

// MARK: - Router Logic

protocol CharacterDetailRouterLogic {
    func navigateToBack()
}

protocol CharacterDetailDataPass {
    var dataStore: CharacterDetailDataStore? { get }
}

extension CharacterDetailViewController: CharacterDetailRouterLogic, CharacterDetailDataPass {

    func navigateToBack() {

        DispatchQueue.main.async { [weak self] in
            self?.dismiss(animated: true)
        }
    }
}
