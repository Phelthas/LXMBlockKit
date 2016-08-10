//
//  NSNotificationCenter+LXMBlock.h
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 16/8/1.
//  Copyright © 2016年 luxiaoming. All rights reserved.
//

/**
 *  这个分类基本是照搬nicklockwood大神的FXNotifications（https://github.com/nicklockwood/FXNotifications）
 *  研究了gitHub上几个可以autoRemove的notification的库，感觉还是FXNotifications最符合平常使用习惯
 *  这里基本只是按自己的代码习惯重新敲了一遍，用到NSOperationQueue的方法还没有自己实际验证过，有用到再说~
 */




#import <Foundation/Foundation.h>

typedef void(^LXMNotificationCallback)(NSNotification *sender);

@interface NSNotificationCenter (LXMBlock)

- (void)addObserver:(id)observer name:(NSString *)name callback:(LXMNotificationCallback)callback;

- (void)addObserver:(id)observer name:(NSString *)name object:(id)object callback:(LXMNotificationCallback)callback;

- (void)addObserver:(id)observer name:(NSString *)name object:(id)object queue:(NSOperationQueue *)queue callback:(LXMNotificationCallback)callback;


/**
 *  用上面的方法添加的observer，只能用此方法删除，否则就只会在Observer销毁的时候才会跟着dealloc;
 */
- (void)lxm_removeObserver:(id)observer name:(NSString *)name object:(id)object;


@end
