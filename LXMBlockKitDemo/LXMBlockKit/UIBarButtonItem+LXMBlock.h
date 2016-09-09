//
//  UIBarButtonItem+LXMBlock.h
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/6/21.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^LXMBarButtonItemCallback)(UIBarButtonItem *sender);

@interface UIBarButtonItem (LXMBlock)

@property (nonatomic, copy, readonly) LXMBarButtonItemCallback itemCallback;

+ (instancetype)itemWithImage:(UIImage *)image callback:(LXMBarButtonItemCallback)callback;

+ (instancetype)itemWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone callback:(LXMBarButtonItemCallback)callback;

+ (instancetype)itemWithTitle:(NSString *)title callback:(LXMBarButtonItemCallback)callback;


+ (instancetype)itemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style callback:(LXMBarButtonItemCallback)callback;

+ (instancetype)itemWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style callback:(LXMBarButtonItemCallback)callback;

+ (instancetype)itemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style callback:(LXMBarButtonItemCallback)callback;

+ (instancetype)itemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem callback:(LXMBarButtonItemCallback)callback;


@end
