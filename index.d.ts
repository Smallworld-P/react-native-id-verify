/**
 * 获取bizcode
 */
export declare function getBizCode(): Promise<string>;

/**
 * 开始身份认证
 * @param url 认证url，从商家服务端获得
 * @param certifyId 认证流水号，从商家服务端获得
 * @param bizcode 表示是否唤起支付宝进行验证
 */
export declare function startVerify(bizcode: string, certifyId: string, url: string): Promise<any>;

