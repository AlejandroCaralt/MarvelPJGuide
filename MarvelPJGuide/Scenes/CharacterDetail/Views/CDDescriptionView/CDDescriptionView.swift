//
//  CDDescriptionView.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 17/06/2021.
//

import UIKit

struct CDDescriptionViewModel {
    var titleText: String
    var descriptionText: String
}

class CDDescriptionView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var decorationView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!

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
        
        descriptionLabel.font = UIFont.regular(size: 14)
        descriptionLabel.textColor = UIColor.marveBlack
        
        decorationView.layer.masksToBounds = false
        decorationView.layer.shadowRadius = 2
        decorationView.layer.shadowOpacity = 1
        decorationView.layer.shadowColor = UIColor.marveBlack.cgColor
        decorationView.layer.shadowOffset = CGSize(width: 0 , height: 2)
    }

    func config(model: CDDescriptionViewModel) {
        
        titleLabel.text = model.titleText
        descriptionLabel.text = model.descriptionText
    }
}
