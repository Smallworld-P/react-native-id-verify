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
RCT_EXPORT_METHOD(startVerify:(NSString *)url
                  certifyId:(NSString *)certifyId
                  bizcode:(NSString *)bizcode
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject) {
    NSDictionary *config = @{
        @"url": url,
        @"certifyId": certifyId,
        @"bizcode": bizcode
    };
    [[APVerifyService sharedService] startVerifyService:config target:self block:^(NSMutableDictionary *resultDic) {
        if (resultDic == nil) {
            reject(@"result is null",resultDic, nil);
        } else {
            resolve(resultDic);
        }
    }];
}


@end
