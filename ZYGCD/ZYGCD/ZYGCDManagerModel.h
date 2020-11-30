//
//  ZYGCDManagerModel.h
//  ZYGCD
//
//  Created by 张宇 on 2020/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYGCDManagerModel : NSObject

#pragma mark -- add method 1
/// 方法名 / 对应owner为class类时调用时必须为+号方法 否则报错
@property (nonatomic, copy) NSString *sel;

/// 方法来源的父类self / class类 ，此时为字符串类型
@property (nonatomic, strong) id owner;

#pragma mark -- add method 2
/// 重写init方法进行添加
/// @param owner 方法来源的父类self / class类 ，此时为字符串类型
/// @param sel 方法名 / 对应owner为class类时调用时必须为+号方法 否则报错
- (instancetype)initAddOwner:(id)owner addSel:(NSString *)sel;

#pragma mark -- 执行方法
/// 执行方法
- (void)invokeMethod;

@end

NS_ASSUME_NONNULL_END
