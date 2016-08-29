//
//  ImageCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by zhangkuo on 16/8/28.
//  Copyright © 2016年 zhkuo. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.cyanColor()
    }

}
