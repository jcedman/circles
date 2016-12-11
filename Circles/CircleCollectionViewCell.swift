//
//  circleCollectionViewCell.swift
//  Circles
//
//  Created by JEFFREY EDMAN on 12/8/16.
//  Copyright © 2016 JEFFREY EDMAN. All rights reserved.
//

import UIKit

class CircleCollectionViewCell: UICollectionViewCell {
 /*
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        layer.cornerRadius = 15
        layer.borderWidth = 3
        layer.borderColor = UIColor.black.cgColor
    }
    

  */  
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
            layer.zPosition = CGFloat(layoutAttributes.zIndex)
        }
    }

