//
//  UIButton+LXMBlock.m
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/6/21.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

#import "UIButton+LXMBlock.h"
#import <objc/runtime.h>


@interface UIButton ()

@property (nonatomic, copy, readwrite) LXMButtonCallback buttonCallback;

@end


@implementation UIButton (LXMBlock)

#pragma mark - Public

- (void)addButtonCallback:(LXMButtonCallback)callback {
    [self addButtonCallback:callback forControlEvents:UIControlEventTouchUpInside];
}

- (void)addButtonCallback:(LXMButtonCallback)callback forControlEvents:(UIControlEvents)controlEvents {
    [self addTarget:self action:@selector(handleLXMButtonCallback:) forControlEvents:controlEvents];
    self.buttonCallback = callback;
}


#pragma mark - Action

- (void)handleLXMButtonCallback:(UIButton *)sender {
    if (self.buttonCallback) {
        self.buttonCallback(sender);
    }
}


#pragma mark - Property

- (LXMButtonCallback)buttonCallback {
    return objc_getAssociatedObject(self, @selector(buttonCallback));
}

- (void)setButtonCallback:(LXMButtonCallback)buttonCallback {
    objc_setAssociatedObject(self, @selector(buttonCallback), buttonCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end



@interface UIControl ()

@property (nonatomic, copy, readwrite) LXMControlCallback controlCallback;

@end


@implementation UIControl (LXMBlock)

#pragma mark - Public

- (void)addSimpleCallback:(LXMControlCallback)callback {
    [self addSimpleCallback:callback forControlEvents:UIControlEventValueChanged];
}

- (void)addSimpleCallback:(LXMControlCallback)callback forControlEvents:(UIControlEvents)controlEvents {
    [self addTarget:self action:@selector(handleLXMControlCallback:) forControlEvents:controlEvents];
    self.controlCallback = callback;
}


#pragma mark - Action

- (void)handleLXMControlCallback:(UIControl *)sender {
    if (self.controlCallback) {
        self.controlCallback(sender);
    }
}


#pragma mark - Property

- (LXMControlCallback)controlCallback {
    return objc_getAssociatedObject(self, @selector(controlCallback));
}

- (void)setControlCallback:(LXMControlCallback)controlCallback {
    objc_setAssociatedObject(self, @selector(controlCallback), controlCallback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}



@end

