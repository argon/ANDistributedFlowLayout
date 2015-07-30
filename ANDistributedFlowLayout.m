//
//  ANDistributedFlowLayout.m
//
//  Originally: KTCenterFlowLayout.m
//  Created by Kyle Truscott on 10/9/14.
//  Copyright (c) 2014 keighl. All rights reserved.
//
//  Modified by Andrew Naylor on 30/07/14
//

#import "ANDistributedFlowLayout.h"

@implementation ANDistributedFlowLayout

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *superAttributes = [NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:rect]];
    
    NSMutableDictionary *rowCollections = [NSMutableDictionary new];
    
    // Collect attributes by their midY coordinate.. i.e. rows!
    
    for (UICollectionViewLayoutAttributes *itemAttributes in superAttributes)
    {
        // Normalize the midY to others in the row
        // with variable cell heights the midYs can be ever so slightly
        // different.
        CGFloat midYRound = roundf(CGRectGetMidY(itemAttributes.frame));
        CGFloat midYPlus = midYRound + 1;
        CGFloat midYMinus = midYRound - 1;
        NSNumber *key;
        
        if (rowCollections[@(midYPlus)])
            key = @(midYPlus);
        
        if (rowCollections[@(midYMinus)])
            key = @(midYMinus);
        
        if (!key)
            key = @(midYRound);
        
        if (!rowCollections[key])
            rowCollections[key] = [NSMutableArray new];
        
        [(NSMutableArray *) rowCollections[key] addObject:itemAttributes];
    }
    
    CGFloat collectionViewWidth = CGRectGetWidth(self.collectionView.bounds) - self.collectionView.contentInset.left - self.collectionView.contentInset.right;
    
    
    // Adjust the items in each row
    [rowCollections enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        NSArray *itemAttributesCollection = obj;
        NSInteger itemsInRow = [itemAttributesCollection count];
        
        // Sum the width of all elements in the row
        CGFloat aggregateItemWidths = 0.f;
        for (UICollectionViewLayoutAttributes *itemAttributes in itemAttributesCollection)
            aggregateItemWidths += CGRectGetWidth(itemAttributes.frame);
        
        // |-x-x-x-x-| ... calculate the total space left
        CGFloat aggregateInteritemSpacing = collectionViewWidth - aggregateItemWidths;
        
        CGFloat interItemSpacing = aggregateInteritemSpacing / (itemsInRow + 1);
        
        // Adjust each item's position to be centered
        CGRect previousFrame = CGRectZero;
        for (UICollectionViewLayoutAttributes *itemAttributes in itemAttributesCollection)
        {
            CGRect itemFrame = itemAttributes.frame;
            
            itemFrame.origin.x = CGRectGetMaxX(previousFrame) + interItemSpacing;
            
            itemAttributes.frame = itemFrame;
            previousFrame = itemFrame;
        }
    }];
    
    return superAttributes;
}

@end
