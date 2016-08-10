//
//  UIButton+LXMBlock.h
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/6/21.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^LXMButtonCallback)(UIButton *sender);

@interface UIButton (LXMBlock)

@property (nonatomic, copy, readonly) LXMButtonCallback buttonCallback;

- (void)addButtonCallback:(LXMButtonCallback)callback;

- (void)addButtonCallback:(LXMButtonCallback)callback forControlEvents:(UIControlEvents)controlEvents;

@end
