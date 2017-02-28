//
//  ACellBook.swift
//  MyBook
//
//  Created by Admin on 2/23/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
let kCellWith: CGFloat =  66
let kLabelHeight: CGFloat = 20
class ACellBook: UICollectionViewCell {
    
    var nameLabel : UILabel!
    var imageView:  UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(kCellWith, kCellWith + kLabelHeight)
    }
    func addSubviews() {
        if (imageView == nil){
            imageView =  UIImageView(frame: CGRectMake(0, 0, kCellWith, kCellWith))
            imageView.layer.borderColor = tintColor.CGColor
            contentView.addSubview(imageView)
        }
        
        if(nameLabel == nil){
            nameLabel = UILabel(frame: CGRectMake(0,kCellWith,kCellWith,kLabelHeight))
            nameLabel.textAlignment = .Left
            nameLabel.textColor = UIColor(white: 0.9, alpha: 1)
            nameLabel.highlightedTextColor = tintColor
            nameLabel.font = UIFont.boldSystemFontOfSize(12)
            contentView.addSubview(nameLabel)
        }
    }
    override var selected: Bool{
        didSet{
            imageView.layer.borderWidth = selected ? 2: 0
            
        }
    }
    
    
}
