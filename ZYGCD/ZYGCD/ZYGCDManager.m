//
//  ZYGCDManager.m
//  ZYGCD
//
//  Created by 张宇 on 2020/11/30.
//

#import "ZYGCDManager.h"

@implementation ZYGCDManager

+ (instancetype)shareManager
{
    return [[self alloc] init];
}

- (void)async_burstWithMethods:(NSMutableArray<ZYGCDManagerModel *> *)methods
                    main_queue:(void (^)(void))main_queue
{
    dispatch_group_t group = dispatch_group_create();
    for (ZYGCDManagerModel *model in methods) { //遍历任务并开启任务
        dispatch_group_async(group,dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_group_enter(group); //进入任务 +1
            [model invokeMethod]; //执行方法
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                dispatch_group_leave(group); //任务结束后离开 -1
            });
        });
    }
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{ //所有任务完成后回到主线程
        main_queue();
    });
}

- (void)async_waitWithFirstMethods:(NSMutableArray<ZYGCDManagerModel *> *)firstMethods
                       waitMethods:(NSMutableArray<ZYGCDManagerModel *> *)waitMethods
                        main_queue:(void (^)(void))main_queue
{
    [self async_burstWithMethods:firstMethods main_queue:^{
        [self async_burstWithMethods:waitMethods main_queue:^{
            main_queue();
        }];
    }];
}

@end
