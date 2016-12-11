//
//  NewCollectionViewLayout.swift
//  Circles
//
//  Created by JEFFREY EDMAN on 12/10/16.
//  Copyright © 2016 JEFFREY EDMAN. All rights reserved.
//

import UIKit

var maxAngle : Float = 0.0 {
didSet{
    //invalidateLayout()
    // sleep(1)
}
}



class NewCollectionViewLayout: UICollectionViewLayout {
    
    var allAttributes = [UICollectionViewLayoutAttributes]()
    
    fileprivate var numberOfItems = 7
    
    var itemSize = CGSize(width: 80,height: 80)
    
    var anglePerItem: CGFloat {
        
        //let angle = Float(3.1416) / Float((collectionView!.numberOfItems(inSection: 0) - 1))
        let angle = maxAngle / Float((collectionView!.numberOfItems(inSection: 0) - 1))
        return CGFloat(angle)
    }
    
    var radius: CGFloat = 250

    
    
    override var collectionViewContentSize : CGSize {
        //return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0))*itemSize.width, height: collectionView!.bounds.height)
        //print("CVsize", collectionView!.bounds.size)
        return collectionView!.bounds.size
    }

    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        allAttributes.removeAll()
        for index in 0 ..< numberOfItems {
            let indexPath = IndexPath(item: index, section: 0)
            allAttributes.append(layoutAttributesForItem(at: indexPath)!)
        }
        return allAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath)
        -> UICollectionViewLayoutAttributes? {
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            let i = indexPath.row
            let iFloat = CGFloat(i)
            
            let originX : CGFloat = 100.0
            let originY : CGFloat = self.collectionView!.bounds.midY   //change to midY view
            let dx = (radius*sin(anglePerItem*iFloat))*0.8
            let dy = radius*cos(anglePerItem*iFloat)
            
            let centerY  =  originY - dy - 2*iFloat
            let centerX =  originX + dx - 4*iFloat
            attributes.size = self.itemSize
            attributes.center = CGPoint(x: centerX, y: centerY)
            attributes.zIndex = i
            
            return attributes
    }
    
        
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
