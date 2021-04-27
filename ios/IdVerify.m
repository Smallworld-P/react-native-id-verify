// IdVerify.m

#import "IdVerify.h"
#import<AlipayVerifySDK/APVerifyService.h>


@implementation IdVerify

RCT_EXPORT_MODULE(RNIdVerify)

- (dispatch_queue_t)methodQueue{
    return dispatch_get_main_queue();
}

/// 获取bizcode
/// @param callback 返回bizcode
RCT_EXPORT_METHOD(getBizCode:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
    NSString *bizcode = [[APVerifyService sharedService] bizCode];
    if (![bizcode isEqualToString:@""] || bizcode != nil) {
        resolve(bizcode);
    } else {
        reject(@"bizcode is null", bizcode, nil);
    }
}

/// 开始认证
/// @param url 认证url，从商家服务端获得
/// @param certifyId 认证流水号，从商家服务端获得
/// @param bizcode 表示是否唤起支付宝进行验证
/// @param callback 返回状态码
RCT_EXPORT_METHOD(startVerify:(NSString *)bizcode
                  certifyId:(NSString *)certifyId
                  url:(NSString *)url
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
    NSDictionary *config = @{
        @"url": url,
        @"certifyId": certifyId,
        @"bizcode": bizcode
    };
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    [[APVerifyService sharedService] startVerifyService:config target:currentVC block:^(NSMutableDictionary *resultDic) {
        if (resultDic == nil) {
            reject(@"result is null", @"start verify error", nil);
        } else {
            resolve(resultDic);
        }
    }];
}

/// 获取当前控制器
- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }

    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    
    return currentVC;
}


@end
