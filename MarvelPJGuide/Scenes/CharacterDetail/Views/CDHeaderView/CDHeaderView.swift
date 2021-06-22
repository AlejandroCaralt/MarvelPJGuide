//
//  CDHeaderView.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 17/06/2021.
//

import UIKit

struct CDHeaderViewModel {
    var headerTitle: String
    var imageUrl: String
}

class CDHeaderView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var decoratorView: UIView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleLabel: UILabel!

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

        titleLabel.font = UIFont.black(size: 25)
        titleLabel.textColor = UIColor.white

        titleView.layer.masksToBounds = false
        titleView.layer.shadowRadius = 10
        titleView.layer.shadowOpacity = 0.5
        titleView.layer.shadowColor = UIColor.marveBlack.cgColor
        titleView.layer.shadowOffset = CGSize(width: 0, height: -20)

        titleView.backgroundColor = UIColor.marveBlack

        decoratorView.backgroundColor = UIColor.marvelRed
        decoratorView.addShadow(to: [.bottom], radius: 15)
    }

    func config(model: CDHeaderViewModel) {

        titleLabel.text = model.headerTitle

        imageView.sd_setImage(with: URL(string: model.imageUrl),
                              placeholderImage: "marvel-image-placeholder".image) { [weak self] (image, _, _, url) in

            if let imgUrl = url, imgUrl.absoluteString.contains("image_not_available") {
                self?.imageView.image = "marvel-image-notfound".image
            }
        }
    }
}
