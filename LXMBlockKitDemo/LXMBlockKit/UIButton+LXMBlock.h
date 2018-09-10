//
//  UIButton+LXMBlock.h
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/6/21.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef void(^LXMButtonCallback)(UIButton * _Nullable sender);

@interface UIButton (LXMBlock)

@property (nonatomic, copy, readonly, nullable) LXMButtonCallback buttonCallback;


/**
 默认的是事件是UIControlEventTouchUpInside
 */
- (void)addButtonCallback:(nonnull LXMButtonCallback)callback;

- (void)addButtonCallback:(nonnull LXMButtonCallback)callback forControlEvents:(UIControlEvents)controlEvents;

@end


typedef void(^LXMControlCallback)(UIControl * _Nullable sender);

@interface UIControl (LXMBlock)

@property (nonatomic, copy, readonly, nullable) LXMControlCallback controlCallback;


/**
 默认的是事件是UIControlEventValueChanged
 */
- (void)addControlCallback:(nonnull LXMControlCallback)callback;

- (void)addControlCallback:(nonnull LXMControlCallback)callback forControlEvents:(UIControlEvents)controlEvents;

@end
