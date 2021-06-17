//
//  CLHeaderView.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import UIKit

class CLHeaderView: UIView {

    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var decoratorView: UIView!

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

        topImageView.image = "marvel-logo".image
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.bold(size: 16)

        decoratorView.backgroundColor = UIColor.marvelRed
        decoratorView.addShadow(to: [.bottom], radius: 15)
    }

    func config(headerTitle: String) {
        titleLabel.text = headerTitle
    }
}
