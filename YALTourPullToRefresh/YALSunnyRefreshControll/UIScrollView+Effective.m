//
//  UIScrollView+Effective.m
//  YALRentalPullToRefresh
//
//  Created by Sergey on 11/8/17.
//  Copyright © 2017 Konstantin Safronov. All rights reserved.
//

#import "UIScrollView+Effective.h"

@implementation UIScrollView (Effective)

-(CGPoint)normalizedContentOffset{
    CGPoint contentOffset = self.contentOffset;
    UIEdgeInsets contentInset = self.effectiveContentInset;
    
    return CGPointMake(contentOffset.x + contentInset.left, contentOffset.y + contentInset.top);
}

-(void)setEffectiveContentInset:(UIEdgeInsets)effectiveContentInset {
    if (@available(iOS 11.0, *)) {
        if (self.contentInsetAdjustmentBehavior != UIScrollViewContentInsetAdjustmentNever) {
            UIEdgeInsets safeArea = self.safeAreaInsets;
            UIEdgeInsets newValue = effectiveContentInset;
            self.contentInset = UIEdgeInsetsMake(newValue.top - safeArea.top,
                                                 newValue.left - safeArea.left,
                                                 newValue.bottom - safeArea.bottom,
                                                 newValue.right - safeArea.right);
            return;
        }
    }
    self.contentInset = effectiveContentInset;
}

-(UIEdgeInsets)effectiveContentInset {
    if (@available(iOS 11.0, *)) {
        return self.adjustedContentInset;
    } else {
        return self.contentInset;
    }
}

@end
