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

#ifndef kNSNotificationCenter
#define kNSNotificationCenter    [NSNotificationCenter defaultCenter]
#endif


#import <Foundation/Foundation.h>

typedef void(^LXMNotificationCallback)(NSNotification * _Nullable sender);

@interface NSNotificationCenter (LXMBlock)

- (void)addObserver:(nonnull id)observer name:(nullable NSString *)name callback:(nonnull LXMNotificationCallback)callback;

- (void)addObserver:(nonnull id)observer name:(nullable NSString *)name object:(nullable id)object callback:(nonnull LXMNotificationCallback)callback;

- (void)addObserver:(nonnull id)observer name:(nullable NSString *)name object:(nullable id)object queue:(nullable NSOperationQueue *)queue callback:(nonnull LXMNotificationCallback)callback;


/**
 批量观察方法，当有好几个通知对应同一个block回调时，可以用这个方法来简化代码
 */
- (void)addObserver:(nonnull id)observer nameArray:(nullable NSArray<NSString *> *)nameArray callback:(nonnull LXMNotificationCallback)callback;

- (void)addObserver:(nonnull id)observer nameArray:(nullable NSArray<NSString *> *)nameArray object:(nullable id)object callback:(nonnull LXMNotificationCallback)callback;

- (void)addObserver:(nonnull id)observer nameArray:(nullable NSArray<NSString *> *)nameArray object:(nullable id)object queue:(nullable NSOperationQueue *)queue callback:(nonnull LXMNotificationCallback)callback;

/**
 *  用上面的方法添加的observer，只能用此方法删除，否则就只会在Observer销毁的时候才会跟着dealloc;
 */
- (void)lxm_removeObserver:(nonnull id)observer name:(nullable NSString *)name object:(nullable id)object;


/**
 主动删除observer观察的所有对象
 */
- (void)lxm_removeObserver:(nonnull id)observer;

@end
