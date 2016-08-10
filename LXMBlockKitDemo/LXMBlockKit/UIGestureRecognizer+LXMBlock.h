//
//  UIGestureRecognizer+LXMBlock.h
//  LXMBlockKitDemo
//
//  Created by kook on 16/7/2.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LXMGestureCallback)(id sender);

@interface UIGestureRecognizer (LXMBlock)

@property (nonatomic, copy, readonly) LXMGestureCallback gestureCallback;

- (instancetype)initWithCallback:(LXMGestureCallback)callback;

@end
