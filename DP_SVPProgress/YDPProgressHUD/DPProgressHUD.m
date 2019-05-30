//
//  DPProgressHUD.m
//  project
//
//  Created by Jtg_yao on 2019/5/29.
//  Copyright © 2019 rocHome. All rights reserved.
//

#import "DPProgressHUD.h"
#import <SVProgressHUD.h>

#define SHOW_IMAGE_SIZE CGSizeMake(50, 50)
#define SHOW_DELAY_TIME 1.5f

@implementation DPProgressHUD

+(void)dp_progessHUDInit {
    
    [SVProgressHUD setDefaultStyle:(SVProgressHUDStyleCustom)];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.78f]];
    [SVProgressHUD setDefaultMaskType:(SVProgressHUDMaskTypeClear)];
    
    [SVProgressHUD setSuccessImage:[UIImage imageNamed:@"hud_success"]];
    [SVProgressHUD setErrorImage:[UIImage imageNamed:@"hud_error"]];
    [SVProgressHUD setInfoImage:[UIImage imageNamed:@"hud_info"]];

    [SVProgressHUD setMinimumDismissTimeInterval:0.0f];
    [SVProgressHUD setMaximumDismissTimeInterval:2.0f];

    [SVProgressHUD setImageViewSize:SHOW_IMAGE_SIZE];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
}

#pragma mark -- 加载中...
+(void)showLoading {
    
    [SVProgressHUD resetOffsetFromCenter];

    [SVProgressHUD show];
}

+(void)showLoadingTip:(NSString *)tip {
    
    [SVProgressHUD resetOffsetFromCenter];

    [SVProgressHUD showWithStatus:tip];
}

#pragma mark -- 进度
+(void)showProgress:(CGFloat)progress {
    
    [SVProgressHUD resetOffsetFromCenter];
    
    [SVProgressHUD showProgress:progress];
}

#pragma mark -- 提示语 -- 居中
+(void)showTip:(NSString *)tip {
    
    [SVProgressHUD resetOffsetFromCenter];
    
    [SVProgressHUD showImage:nil status:tip];
    [SVProgressHUD dismissWithDelay:SHOW_DELAY_TIME completion:nil];
}

+(void)showTip:(NSString *)tip delay:(CGFloat)delay {
    
    [SVProgressHUD resetOffsetFromCenter];
    
    [SVProgressHUD showImage:nil status:tip];
    [SVProgressHUD dismissWithDelay:delay completion:nil];
}

+(void)showTip:(NSString *)tip delay:(CGFloat)delay complete:(void(^)(void))complete {
    
    [SVProgressHUD resetOffsetFromCenter];

    [SVProgressHUD showImage:nil status:tip];
    [SVProgressHUD dismissWithDelay:delay completion:complete];
}

#pragma mark -- success、fail、info
+(void)showSuccessTip:(NSString *)tip {
    
    [SVProgressHUD resetOffsetFromCenter];
    [SVProgressHUD showSuccessWithStatus:tip];
}

+(void)showFailureTip:(NSString *)tip {
    
    [SVProgressHUD resetOffsetFromCenter];
    [SVProgressHUD showErrorWithStatus:tip];
}

+(void)showInfoTip:(NSString *)tip {
    
    [SVProgressHUD resetOffsetFromCenter];
    [SVProgressHUD showInfoWithStatus:tip];
}

#pragma mark -- 自定义图片提示
+(void)showImage:(UIImage *)image tip:(NSString *)tip {
    
    [SVProgressHUD resetOffsetFromCenter];
    [SVProgressHUD showImage:image status:tip];
}

#pragma mark -- 提示，下偏移
+(void)showBottomTip:(NSString *)tip {
    
    [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0.0, [UIScreen mainScreen].bounds.size.height/2 - kTabBarH - 20)];
    [SVProgressHUD showImage:nil status:tip];
}

#pragma mark -- 消失
+(void)dissMissHUD {
    [SVProgressHUD dismiss];
}

+(void)dissMissDelay:(CGFloat)delay Complete:(void(^)(void))complete {
    [SVProgressHUD dismissWithDelay:delay completion:complete];
}

#pragma mark -- 消失回调
+(void)dissMissComplete:(void(^)(void))complete {
    [SVProgressHUD dismissWithDelay:0.0f completion:complete];
}

@end
