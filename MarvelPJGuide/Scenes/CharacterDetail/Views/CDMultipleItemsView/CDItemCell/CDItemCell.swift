//
//  CDItemCell.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 17/06/2021.
//

import UIKit

class CDItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {

        titleLabel.font = UIFont.regular(size: 14)
        titleLabel.textColor = UIColor.gray
    }

    func config(title: String) {

        titleLabel.text = title

        self.accessibilityLabel = title
        self.accessibilityIdentifier = title
    }
}
