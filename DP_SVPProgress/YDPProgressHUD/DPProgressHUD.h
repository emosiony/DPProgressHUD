//
//  DPProgressHUD.h
//  project
//
//  Created by Jtg_yao on 2019/5/29.
//  Copyright © 2019 rocHome. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DPProgressHUD : NSObject

// 初始化
+(void)dp_progessHUDInit;


#pragma mark -- 加载中...
+(void)showLoading;

+(void)showLoadingTip:(NSString *)tip;

#pragma mark -- 进度
+(void)showProgress:(CGFloat)progress;

#pragma mark -- 提示语 -- 居中
+(void)showTip:(NSString *)tip;

+(void)showTip:(NSString *)tip delay:(CGFloat)delay;

+(void)showTip:(NSString *)tip delay:(CGFloat)delay complete:(void(^)(void))complete;

#pragma mark -- success、fail、info
+(void)showSuccessTip:(NSString *)tip;

+(void)showFailureTip:(NSString *)tip;

+(void)showInfoTip:(NSString *)tip;

#pragma mark -- 自定义图片提示
+(void)showImage:(UIImage *)image tip:(NSString *)tip;

#pragma mark -- 提示，下偏移
+(void)showBottomTip:(NSString *)tip;

#pragma mark -- 消失
+(void)dissMissHUD;

+(void)dissMissDelay:(CGFloat)delay Complete:(void(^)(void))complete;

#pragma mark -- 消失回调
+(void)dissMissComplete:(void(^)(void))complete;

@end

NS_ASSUME_NONNULL_END
