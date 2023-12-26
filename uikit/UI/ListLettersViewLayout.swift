//
//  ListLettersViewLayout.swift
//  word_uikit
//
//  Created by Vladislav Muravyev on 25.12.2023.
//

import UIKit

class ListLettersViewLayout: UICollectionViewLayout {
    
    var itemSize = CGSize(width: 200, height: 150)
    var attributesList = [UICollectionViewLayoutAttributes]()
    public var rowNum = CGFloat(4)

    override func prepare() {
        super.prepare()
        
        let itemNo = collectionView?.numberOfItems(inSection: 0) ?? 0
        let length = (collectionView!.frame.width - 40)/rowNum
        itemSize = CGSize(width: length, height: length)
        // The compiler is unable to type-check this expression in reasonable time; try breaking up the expression into distinct sub-expressions
        // To resolve this, you just need to break your expression into smaller parts
//        
//        attributesList = (0..<itemNo).map {
//            (i) -> UICollectionViewLayoutAttributes in
//            let attributes = UICollectionViewLayoutAttributes(forCellWith: IndexPath(item: i, section: 0))
//            
//            attributes.size = self.itemSize
//            var padding = 10
//            var bleedingX: CGFloat = collectionView?.bounds.width / ((Int(rowNum) + padding) - padding)
//            var x = CGFloat(i%Int(rowNum) * (itemSize.width+padding) + bleedingX)
//            var y = CGFloat(i/Int(rowNum) * (itemSize.width+padding) + bleedingX)
//            attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)
//
//// make the first one biggest
////            if i > 2 {
////                y += (itemSize.width+10)
////                attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)
////            } else if i == 0 {
////                attributes.frame = CGRect(x: x, y: y, width: itemSize.width*2+10, height: itemSize.height*2+10)
////            } else {
////                x = itemSize.width*2 + 30
////                if i == 2 {
////                    y += itemSize.height + 10
////                }
////                attributes.frame = CGRect(x: x, y: y, width: itemSize.width, height: itemSize.height)
////            }
//            
//            return attributes
//        }
    }
    
    override var collectionViewContentSize : CGSize {
        
        return CGSize(width: collectionView!.bounds.width, height: (itemSize.height + 10)*CGFloat(ceil(Double(collectionView!.numberOfItems(inSection: 0))/3))+(itemSize.height + 20))
        
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        if indexPath.row < attributesList.count
        {
            return attributesList[indexPath.row]
        }
        return nil
    }
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }}
