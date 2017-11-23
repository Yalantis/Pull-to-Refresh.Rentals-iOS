//
//  UIScrollView+Effective.h
//  YALRentalPullToRefresh
//
//  Created by Sergey on 11/8/17.
//  Copyright © 2017 Konstantin Safronov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Effective)

@property (nonatomic, assign, readonly) CGPoint normalizedContentOffset;
@property (nonatomic, assign, readwrite) UIEdgeInsets effectiveContentInset;

@end
