//
//  CharactersListViewController.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//  Copyright (c) 2021 Alejandro Caralt. All rights reserved.
//

import UIKit

protocol CharactersListPresenterLogic {
    func setupView()
    func getCollectionItems(section: Int) -> Int
    func getCollectionCellModel(indexPath: IndexPath) -> CLCollectionCellModel?
    func getCollectionInset() -> CGFloat
    func getCollectionMinLineSpace() -> CGFloat
    func getCollectionMinInterSpace() -> CGFloat
    func getCollectionCellsPerRow() -> Int
    func collectionCellSelectedAt(indexPath: IndexPath)
    func calculatePagesInScroll(contentOffset: CGFloat, maximumOffset: CGFloat)
}

class CharactersListViewController: UIViewController {
    var presenter: CharactersListPresenterLogic?
    var dataStore: CharactersListDataStore?
    
    // MARK: Object lifecycle
    @IBOutlet weak var headerView: CLHeaderView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    // MARK: Setup

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }
  
    func setupScene() {
        let viewController = self
        let presenter = CharactersListPresenter()
        
        presenter.view = viewController
        viewController.dataStore = presenter
        self.presenter = presenter
    }
  
    // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupView()
    }
}

// MARK: - Display Logic

extension CharactersListViewController: CharactersListDisplayLogic {

    func setupView() {

        bottomLabel.font = UIFont.black(size: 12)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = true
        collectionView.register(CLCollectionCell.self)
    }

    func config(headerView model: String) {
        
        DispatchQueue.main.async { [weak self] in
            self?.headerView.config(headerTitle: model)
        }
    }

    func config(footerView model: String) {

        DispatchQueue.main.async { [weak self] in
            self?.bottomLabel.text = model
        }
    }

    func reloadCollection() {
        
        DispatchQueue.main.async { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

// MARK: - Delegates

extension CharactersListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getCollectionItems(section: section) ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell: CLCollectionCell = collectionView.dequeueReusableCell(for: indexPath),
              let model = presenter?.getCollectionCellModel(indexPath: indexPath) else {
            return UICollectionViewCell()
        }
        
        cell.config(model: model)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        guard let inset = presenter?.getCollectionInset() else {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }

        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        guard let minimumLineSpacing = presenter?.getCollectionMinLineSpace() else {
            return 0
        }

        return minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        guard let minimumInteritemSpacing = presenter?.getCollectionMinInterSpace() else {
            return 0
        }

        return minimumInteritemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let inset = presenter?.getCollectionInset(),
              let minimumInteritemSpacing = presenter?.getCollectionMinInterSpace(),
              let cellsPerRow = presenter?.getCollectionCellsPerRow() else {
            return CGSize()
        }

        let marginsAndInsets = inset * 2 + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        let itemHeigth = itemWidth * 1.5

        return CGSize(width: itemWidth, height: itemHeigth)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.collectionCellSelectedAt(indexPath: indexPath)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height

        presenter?.calculatePagesInScroll(contentOffset: contentOffset, maximumOffset: maximumOffset)
    }
}

// MARK: - Router Logic

protocol CharactersListRouterLogic {
    func navigateToCharacterDetail()
    func popUpErrorAlert()
}

protocol CharactersListDataPass {
    var dataStore: CharactersListDataStore? { get }
}

extension CharactersListViewController: CharactersListRouterLogic, CharactersListDataPass {

    func navigateToCharacterDetail() {

        DispatchQueue.main.async { [weak self] in
            guard let cdVC = ViewReference.characterDetail.scene() as? CharacterDetailViewController,
                  let dataStore = self?.dataStore, let character = dataStore.selectedCharacter else { return }

            cdVC.dataStore?.characterModel = character
            cdVC.modalPresentationStyle = .overFullScreen
            self?.show(cdVC, sender: nil)
        }
    }

    func popUpErrorAlert() {
        
        DispatchQueue.main.async { [weak self] in

            let alert = UIAlertController(title: nil,
                                          message: "generic_error".localized,
                                                          preferredStyle: .alert)

            let okAction = UIAlertAction(title: "Ok".localized, style: .default)
            alert.addAction(okAction)

            self?.present(alert, animated: true)
        }
    }
}
