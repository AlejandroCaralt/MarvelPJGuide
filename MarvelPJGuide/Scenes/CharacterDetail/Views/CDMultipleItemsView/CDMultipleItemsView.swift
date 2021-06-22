//
//  CDMultipleItemsView.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 17/06/2021.
//

import UIKit

struct CDMultipleItemsViewModel {
    var titleText: String
    var items: [String]
}

class CDMultipleItemsView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var decorationView: UIView!
    @IBOutlet weak var tableView: UITableView!

    var items: [String] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupView()
    }

    func setupView() {

        titleLabel.font = UIFont.bold(size: 18)
        titleLabel.textColor = UIColor.marveBlack

        decorationView.layer.masksToBounds = false
        decorationView.layer.shadowRadius = 2
        decorationView.layer.shadowOpacity = 1
        decorationView.layer.shadowColor = UIColor.marveBlack.cgColor
        decorationView.layer.shadowOffset = CGSize(width: 0, height: 2)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CDItemCell.self)
        tableView.allowsSelection = false
    }

    func config(model: CDMultipleItemsViewModel) {

        titleLabel.text = model.titleText
        self.items = model.items

        tableView.reloadData()
    }
}

extension CDMultipleItemsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard items.count > indexPath.row, let cell: CDItemCell = tableView.dequeueReusableCell() else {
            return UITableViewCell()
        }

        cell.config(title: items[indexPath.row])

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
