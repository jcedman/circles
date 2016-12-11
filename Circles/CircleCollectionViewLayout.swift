//
//  CircleCollectionViewLayout.swift
//  Circles
//
//  Created by JEFFREY EDMAN on 12/8/16.
//  Copyright © 2016 JEFFREY EDMAN. All rights reserved.
//

import UIKit



class CircleCollectionViewLayout: UICollectionViewLayout {
    
    let itemSize = CGSize(width: 80, height: 80)
    
    fileprivate let centerDiff: CGFloat = 40
    fileprivate var numberOfItems = 0
    var radius: CGFloat = 250
    
    //fileprivate var updateItems = [UICollectionViewUpdateItem]()
    
    var anglePerItem: CGFloat {

        //let angle = Float(3.1416) / Float((collectionView!.numberOfItems(inSection: 0) - 1))
        let angle = maxAngle / Float((collectionView!.numberOfItems(inSection: 0) - 1))
        return CGFloat(angle)
    }

//FROM HERE
    var angleAtExtreme: CGFloat {
        return 1.0
    }
    
    var angle: CGFloat {
        return angleAtExtreme*collectionView!.contentOffset.x/(collectionViewContentSize.width - collectionView!.bounds.width)
    }
//TO HERE is probably useless
/*
    override func prepare(forCollectionViewUpdates updateItems: [UICollectionViewUpdateItem]) {
        super.prepare(forCollectionViewUpdates: updateItems)
        self.updateItems = updateItems
    }
*/
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    //var attributesList = [CircleCollectionViewLayoutAttributes]()
    
    override var collectionViewContentSize : CGSize {
        //return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0))*itemSize.width, height: collectionView!.bounds.height)
        print("CVsize", collectionView!.bounds.size)
        return collectionView!.bounds.size
    }
/*    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var allAttributes = [UICollectionViewLayoutAttributes]()
        for index in 0 ..< numberOfItems {
            let indexPath = IndexPath(item: index, section: 0)
            allAttributes.append(layoutAttributesForItem(at: indexPath)!)
        }
        return allAttributes
        
    }
*/    
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
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = layoutAttributesForItem(at: itemIndexPath)
        
        return attributes
    }
/*
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
                let finalIndex = finalIndexForIndexPath(itemIndexPath)
        let shiftedIndexPath = IndexPath(item: finalIndex, section: itemIndexPath.section)
        
        return layoutAttributesForItem(at: shiftedIndexPath)
    }
*/
    override func finalizeCollectionViewUpdates() {
        super.finalizeCollectionViewUpdates()
       // updateItems.removeAll(keepingCapacity: true)
    }
    
    
    
}
/*
            let attributesList = (0...numberOfItems).map { (i) -> UICollectionViewLayoutAttributes in
            let iFloat = CGFloat(i)
            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
            let originX : CGFloat = 100.0
            let originY : CGFloat = self.collectionView!.bounds.midY   //change to midY view
            let dx = (radius*sin(anglePerItem*iFloat))*0.8
            let dy = radius*cos(anglePerItem*iFloat)
            
            let centerY  =  originY - dy - 2*iFloat
            let centerX =  originX + dx - 4*iFloat
            attributes.size = self.itemSize
            attributes.center = CGPoint(x: centerX, y: centerY)
            //attributes.zIndex = i            //attributes.center = CGPoint(x: itemSize.height + itemSize.height*CGFloat(i)/2, y: self.collectionView!.bounds.midY)
           //attributes.center = CGPoint(x: centerX, y: self.collectionView!.bounds.midY)
            //attributes.angle = (self.anglePerItem*CGFloat(i)) //self.angle + (self.anglePerItem*CGFloat(i))
            //attributes.anchorPoint = CGPoint(x: 0.5, y: (self.collectionView?.bounds.midY)!)
            //attributes.anchorPoint = CGPoint(x: 0.5, y: 0.5)
            
            //attributes.anchorPoint = CGPoint(x: 1.0 , y: 0.5 )
            //anchorPt = attributes.anchorPoint
            
            return attributesList
        }
    }
    

    

    }
*/
