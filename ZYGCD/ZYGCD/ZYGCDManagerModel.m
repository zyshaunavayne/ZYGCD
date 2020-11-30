//
//  ZYGCDManagerModel.m
//  ZYGCD
//
//  Created by 张宇 on 2020/11/30.
//

#import "ZYGCDManagerModel.h"

@implementation ZYGCDManagerModel

- (instancetype)initAddOwner:(id)owner addSel:(NSString *)sel;
{
    if (self) {
        self.owner = owner;
        self.sel = sel;
    }
    return self;
}

- (void)invokeMethod
{
    if (self.owner && self.sel) {
        SEL sel = NSSelectorFromString(self.sel); //获取方法
        if ([self.owner isKindOfClass:NSString.class]) { //如果是字符类型 则为类的+号方法
            NSMethodSignature *methodSingature = [NSClassFromString(self.owner) methodSignatureForSelector:sel]; //获取方法签名
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSingature]; //获取方法签名对应的invocation
            [invocation setTarget:NSClassFromString(self.owner)]; //设置消息接受者
            [invocation setSelector:sel]; //设置要执行的selector
            [invocation invoke];  //开始执行方法
        }else{
            NSMethodSignature *methodSingature = [self.owner methodSignatureForSelector:sel]; //获取方法签名
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSingature]; //获取方法签名对应的invocation
            [invocation setTarget:self.owner]; //设置消息接受者
            [invocation setSelector:sel]; //设置要执行的selector
            [invocation invoke];  //开始执行方法
        }
    } else {
        NSLog(@"检查下方法或者实class、self 不存在");
    }
}

@end
