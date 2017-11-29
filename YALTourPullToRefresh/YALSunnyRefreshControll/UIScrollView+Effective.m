//
//  UIScrollView+Effective.m
//  YALRentalPullToRefresh
//
//  Created by Sergey on 11/8/17.
//  Copyright © 2017 Konstantin Safronov. All rights reserved.
//

#import "UIScrollView+Effective.h"
#import <objc/runtime.h>

@implementation UIScrollView (Effective)

#pragma mark Normalized offset

-(void)setNormalizedContentOffset:(CGPoint)normalizedContentOffset {
    CGPoint contentOffset = self.contentOffset;
    UIEdgeInsets contentInset = self.effectiveContentInset;
    
    contentOffset = CGPointMake(contentOffset.x + contentInset.left, contentOffset.y + contentInset.top);
}

-(CGPoint)normalizedContentOffset{
    CGPoint contentOffset = self.contentOffset;
    UIEdgeInsets contentInset = self.effectiveContentInset;
    
    return CGPointMake(contentOffset.x + contentInset.left, contentOffset.y + contentInset.top);
}

#pragma mark Effective content insets

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


#pragma mark Top bounce limit

-(CGFloat)topBounceLimit{
    NSNumber* topLimit = objc_getAssociatedObject(self, "_topBounceLimit");
    return [topLimit floatValue];
}

-(void)setTopBounceLimit:(CGFloat)topBounceLimit {
    NSNumber* topLimit = [NSNumber numberWithFloat:topBounceLimit];
    objc_setAssociatedObject(self, "_topBounceLimit", topLimit, OBJC_ASSOCIATION_RETAIN);
}

#pragma mark Swizzling

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(setContentOffset:);
        SEL swizzledSelector = @selector(swizzled_setContentOffset:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class,
                                            originalSelector,
                                            method_getImplementation(swizzledMethod),
                                            method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

-(void)swizzled_setContentOffset:(CGPoint)contentOffset {
    CGFloat topInset = self.effectiveContentInset.top - self.contentInset.top;
    if (isnan(self.topBounceLimit) || !(contentOffset.y + topInset < self.topBounceLimit)) {
        [self swizzled_setContentOffset:contentOffset];
    } else {
        [self swizzled_setContentOffset: CGPointMake(contentOffset.x, self.topBounceLimit - topInset)];
    }
}

@end
