//
//  UIBarButtonItem+LXMBlock.m
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/6/21.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "UIBarButtonItem+LXMBlock.h"
#import <objc/runtime.h>

@interface UIBarButtonItem ()

@property (nonatomic, copy, readwrite) LXMBarButtonItemCallback itemCallback;


@end

@implementation UIBarButtonItem (LXMBlock)

#pragma mark - Public

+ (instancetype)itemWithImage:(UIImage *)image style:(UIBarButtonItemStyle)style callback:(LXMBarButtonItemCallback)callback {
    UIBarButtonItem *item = nil;
    item = [[UIBarButtonItem alloc] initWithImage:image style:style target:item action:@selector(handleLXMBarButtonItemCallback:)];
    item.itemCallback = callback;
    item.target = item;//如果没有这一句，item的target其实是nil，有时候依然可以正常调用selector，貌似是因为响应链的传递；但有时候又不能正常调用（viewController不是firstResponese的时候）；所以统一加这么一句修复下
    return item;
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
//    item.image = image;
//    item.style = style;
//    item.target = item;
//    item.itemCallback = callback;
//    item.action = @selector(handleLXMBarButtonItemCallback:);
//    return item;
}

+ (instancetype)itemWithImage:(UIImage *)image landscapeImagePhone:(UIImage *)landscapeImagePhone style:(UIBarButtonItemStyle)style callback:(LXMBarButtonItemCallback)callback {
    UIBarButtonItem *item = nil;
    item = [[UIBarButtonItem alloc] initWithImage:image landscapeImagePhone:landscapeImagePhone style:style target:item action:@selector(handleLXMBarButtonItemCallback:)];
    item.itemCallback = callback;
    item.target = item;//如果没有这一句，item的target其实是nil，有时候依然可以正常调用selector，貌似是因为响应链的传递；但有时候又不能正常调用（viewController不是firstResponese的时候）；所以统一加这么一句修复下
    return item;
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
//    item.image = image;
//    item.landscapeImagePhone = landscapeImagePhone;
//    item.style = style;
//    item.target = item;
//    item.itemCallback = callback;
//    item.action = @selector(handleLXMBarButtonItemCallback:);
//    return item;
}

+ (instancetype)itemWithTitle:(NSString *)title style:(UIBarButtonItemStyle)style callback:(LXMBarButtonItemCallback)callback {
    UIBarButtonItem *item = nil;
    item = [[UIBarButtonItem alloc] initWithTitle:title style:style target:item action:@selector(handleLXMBarButtonItemCallback:)];
    item.itemCallback = callback;
    item.target = item;//如果没有这一句，item的target其实是nil，有时候依然可以正常调用selector，貌似是因为响应链的传递；但有时候又不能正常调用（viewController不是firstResponese的时候）；所以统一加这么一句修复下
    return item;
    
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] init];
//    item.title = title;
//    item.style = style;
//    item.target = item;
//    item.itemCallback = callback;
//    item.action = @selector(handleLXMBarButtonItemCallback:);
//    return item;
}

+ (instancetype)itemWithBarButtonSystemItem:(UIBarButtonSystemItem)systemItem callback:(LXMBarButtonItemCallback)callback {
    UIBarButtonItem *item = nil;//[[UIBarButtonItem alloc] init];
    item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:item action:@selector(handleLXMBarButtonItemCallback:)];
    item.itemCallback = callback;
    item.target = item;//如果没有这一句，item的target其实是nil，有时候依然可以正常调用selector，貌似是因为响应链的传递；但有时候又不能正常调用（viewController不是firstResponese的时候）；所以统一加这么一句修复下
    return item;
}







#pragma mark - Private

- (void)handleLXMBarButtonItemCallback:(UIBarButtonItem *)sender {
    if (self.itemCallback) {
        self.itemCallback(sender);
    }
}

#pragma mark - Property

- (LXMBarButtonItemCallback)itemCallback {
    return objc_getAssociatedObject(self, @selector(itemCallback));
}

- (void)setItemCallback:(LXMBarButtonItemCallback)itemCallback {
    objc_setAssociatedObject(self, @selector(itemCallback), itemCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}


@end
