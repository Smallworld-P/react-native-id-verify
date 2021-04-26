// main index.js

'use strict';

import { NativeModules } from 'react-native';

const idVerifyModule = NativeModules.RNIdVerify;

/**
 * 获取bizcode
 * @returns 
 */
export function getBizCode() {
    return idVerifyModule.getBizCode()
}

/**
 * 开始身份认证
 * @param url 认证url，从商家服务端获得
 * @param certifyId 认证流水号，从商家服务端获得
 * @param bizcode 表示是否唤起支付宝进行验证
 */
export function startVerify(url, certifyId, bizcode) {
    return idVerifyModule.startVerify(url, certifyId, bizcode)
}