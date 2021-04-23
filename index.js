// main index.js

'use strict';

import { NativeModules } from 'react-native';

export const _Module = NativeModules.RNIdVerify;
export class RNIdVerify{

    /**
     * 获取bizcode
     */
    static getBizcode() {
        return _Module.getBizcode().then((result) => {
            return result
        })
    }

    /**
     * 开始身份认证
     * @param url 认证url，从商家服务端获得
     * @param certifyId 认证流水号，从商家服务端获得
     */
    static startVerify(url, certifyId) {
        return _Module.startVerify(url, certifyId).then((result) => {
            return result
        })
    }
}
