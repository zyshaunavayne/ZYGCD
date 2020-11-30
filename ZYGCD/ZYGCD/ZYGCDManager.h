//
//  ZYGCDManager.h
//  ZYGCD
//
//  Created by 张宇 on 2020/11/30.
//

#import <Foundation/Foundation.h>
#import "ZYGCDManagerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYGCDManager : NSObject

/// 初始化
+ (instancetype)shareManager;

/// 异步执行+并发队列
/// modthArray异步并发执行，全部完成后回到主线程
/// @param methods 方法数组
/// @param main_queue 回到主线程
- (void)async_burstWithMethods:(NSMutableArray<ZYGCDManagerModel *> *)methods
                    main_queue:(void (^)(void))main_queue;

/// 异步执行+优先执行方法+等待执行方法+并发队列
/// @param firstMethods 优先执行方法
/// @param waitMethods 等待执行方法
/// @param main_queue 回到主线程
- (void)async_waitWithFirstMethods:(NSMutableArray<ZYGCDManagerModel *> *)firstMethods
                       waitMethods:(NSMutableArray<ZYGCDManagerModel *> *)waitMethods
                        main_queue:(void (^)(void))main_queue;

@end

NS_ASSUME_NONNULL_END
