// IdVerify.m

#import "IdVerify.h"
#import<AlipayVerifySDK/APVerifyService.h>


@implementation IdVerify

RCT_EXPORT_MODULE(RCTIdVerify)

- (dispatch_queue_t)methodQueue{
    return dispatch_get_main_queue();
}


/// 开始认证
/// @param url 认证url，从商家服务端获得
/// @param certifyId 认证流水号，从商家服务端获得
/// @param callback 返回状态码
RCT_EXPORT_METHOD(startVerify:(NSString *)url
                  certifyId:(NSString *)certifyId
                  callback:(RCTPromiseResolveBlock)callback) {
    NSString *bizcode = [[APVerifyService sharedService] bizCode];
    /// url: 认证url，从商家服务端获得
    /// certifyId: 认证流水号，从商家服务端获得
    /// bizcode: 表示是否唤起支付宝进行验证
    NSDictionary *config = @{
        @"url": url,
        @"certifyId": certifyId,
        @"bizcode": bizcode
    };
    [[APVerifyService sharedService] startVerifyService:config target:self block:^(NSMutableDictionary *resultDic) {
        callback(resultDic);
    }];
}


@end
