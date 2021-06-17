//
//  CLCollectionCell.swift
//  MarvelPJGuide
//
//  Created by Alejandro Caralt Caralt on 16/06/2021.
//

import UIKit
import SDWebImage

struct CLCollectionCellModel {
    var imageUrl: String
    var bottomTitle: String
}

class CLCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }

    func setupView() {

        bottomView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.7)
//        bottomView.addShadow(to: [.top], radius: 4, opacity: 0.2)
        bottomLabel.font = UIFont.black(size: 14)
        bottomLabel.textColor = UIColor.darkText

        self.layer.masksToBounds = false
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0 , height:2)
    }

    func config(model: CLCollectionCellModel) {

        imageView.sd_setImage(with: URL(string: model.imageUrl), placeholderImage: "marvel-image-placeholder".image) { [weak self] (image, error, _, url) in

            if let imgUrl = url, imgUrl.absoluteString.contains("image_not_available") {
                self?.imageView.image = "marvel-image-notfound".image
            }
        }

        bottomLabel.text = model.bottomTitle
    }
}
